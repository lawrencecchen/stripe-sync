import SwaggerParser from "@apidevtools/swagger-parser";
import fs from "fs-extra";
import invariant from "tiny-invariant";
import z from "zod";
import { eventToResource, Resource } from "./utils/eventToResource";

const SPEC_PATH = "./stripe-openapi/openapi/spec3.json";

function isStringArray(value: any): value is string[] {
  return Array.isArray(value) && value.every((v) => typeof v === "string");
}

function resolveRef(schema: any, ref: string) {
  const [_, ...path] = ref.split("/");
  let result = schema;
  for (const part of path) {
    result = result[part];
  }
  return result;
}

function isObject(obj: any) {
  return typeof obj === "object" && !Array.isArray(obj) && obj !== null;
}

function recursivelyDereference(obj: object, schema: any) {
  if (!obj || !isObject(obj)) {
    return obj;
  }
  if (obj["$ref"]) {
    const ref = obj["$ref"];
    return resolveRef(schema, ref);
  }
  if (obj["allOf"]) {
    return {
      allOf: obj["allOf"].map((o) => recursivelyDereference(o, schema)),
    };
  }
  if (obj["oneOf"]) {
    return {
      oneOf: obj["oneOf"].map((o) => recursivelyDereference(o, schema)),
    };
  }
  if (obj["anyOf"]) {
    return {
      anyOf: obj["anyOf"].map((o) => recursivelyDereference(o, schema)),
    };
  }
  const out = {};
  for (const key of Object.keys(obj)) {
    out[key] = recursivelyDereference(obj[key], schema);
  }
  return out;
}

function getUniqueResources(resources: Resource[]): Resource[] {
  const usedResources = new Set<string>();
  const uniqueResources = new Array<Resource>();
  for (const resource of resources) {
    if (!usedResources.has(resource.resource)) {
      usedResources.add(resource.resource);
      uniqueResources.push(resource);
    }
  }
  return uniqueResources;
}

function getResourceSchemaHeuristic(schemas: any, resource: Resource) {
  const fullResource = resource.subresource
    ? `${resource.subresource}.${resource.resource}`
    : resource.resource;
  if (schemas[fullResource]) {
    return schemas[fullResource];
  }
  if (schemas[resource.resource]) {
    return schemas[resource.resource];
  }
  // issuing_authorization => issuing.authorization, issuing_card=>issuing.card...
  const dotSyntax = resource.resource.replace(/_/g, ".");
  if (schemas[dotSyntax]) {
    return schemas[dotSyntax];
  }
  // source.transaction -> source_transaction
  const underscoreSyntax = `${resource.subresource}_${resource.resource}`;
  if (schemas[underscoreSyntax]) {
    return schemas[underscoreSyntax];
  }
  console.error(
    `Could not find schema for resource: ${JSON.stringify(resource)}`
  );
}

async function main() {
  try {
    const t1 = performance.now();
    const spec = await SwaggerParser.parse(SPEC_PATH) as any;
    const webhookEndpoints = spec["paths"]["/v1/webhook_endpoints"];
    const webhookEndpointsSchema =
      webhookEndpoints["post"]["requestBody"]["content"][
        "application/x-www-form-urlencoded"
      ]["schema"];
    // const apiVersions = schema["properties"]["api_version"]["enum"];
    const enabledEvents =
      webhookEndpointsSchema["properties"]["enabled_events"]["items"]["enum"];
    invariant(
      isStringArray(enabledEvents),
      "enabledEvents is not string array"
    );
    const schemas = spec["components"]["schemas"];

    // const eventTableMap = {};
    // for (const event of enabledEvents) {
    //   if (event === "*") {
    //     continue;
    //   }
    //   const resource = eventToResource(event);
    //   const foo = getResourceSchemaHeuristic2(schemas, resource);
    //   console.log(event, resource);
    // }

    const resources = enabledEvents
      .filter((r) => r !== "*")
      .map(eventToResource);

    const uniqueResources = getUniqueResources(resources);

    const webhookResources = {};
    const dereferencedResources = {};
    for (const resource of uniqueResources) {
      // todo: fix external accounts
      if (resource.resource === "external_account") {
        continue;
      }
      const webhookResourceSchema = getResourceSchemaHeuristic(
        schemas,
        resource
      );
      if (!webhookResourceSchema) {
        continue;
      }
      webhookResources[resource.resource] = webhookResourceSchema;
      const dereferenced = recursivelyDereference(webhookResourceSchema, spec);
      dereferencedResources[resource.resource] = dereferenced;
    }

    const schemaObjectValidator = z.object({
      properties: z.record(z.string(), z.any()),
      required: z.array(z.string()).optional(),
    });
    const propertyValidator = z.object({
      description: z.string().optional(),
      type: z
        .enum(["string", "object", "boolean", "integer", "array", "number"])
        .optional(),
      nullable: z.boolean().optional(),
    });
    type Property = z.infer<typeof propertyValidator>;

    function resolveType(column: string, property: Property) {
      if (
        !property.type ||
        property.type === "array" ||
        property.type === "object"
      ) {
        column;
        return `jsonb`;
      } else if (property.type === "boolean") {
        return `boolean`;
      } else if (property.type === "integer" || property.type === "number") {
        return `integer`;
      } else if (property.type === "string") {
        return `text`;
      }
    }

    function interpolateColumnAndProperty(
      column: string,
      property: Property,
      required: boolean
    ) {
      if (required) {
        return `"${column}" ${resolveType(column, property)} not null`;
      } else {
        return `"${column}" ${resolveType(column, property)}`;
      }
    }

    const tableColumns = {};

    for (const [resource, _schema] of Object.entries(dereferencedResources)) {
      const schema = schemaObjectValidator.parse(_schema);
      tableColumns[resource] = Object.keys(schema.properties);
    }

    let ddl = `CREATE SCHEMA stripe;\n`;
    for (const [resource, _schema] of Object.entries(dereferencedResources)) {
      ddl += `CREATE TABLE stripe.${resource} (\n`;
      const schema = schemaObjectValidator.parse(_schema);
      const required = new Set(schema.required);
      // console.log(required);
      const columnDefinitions = Object.entries(schema.properties).map(
        ([column, property]) =>
          interpolateColumnAndProperty(column, property, required.has(column))
      );
      ddl += `  ${columnDefinitions.join(",\n  ")}\n`;
      ddl += ");\n";
    }

    fs.ensureDirSync("./generated");
    fs.writeFileSync("./generated/postgres.sql", ddl);
    fs.writeFileSync(
      "./generated/tableColumns.json",
      JSON.stringify(tableColumns, null, 2)
    );
    fs.writeFileSync(
      "./generated/stripeTables.ts",
      `export const stripeTables = ${JSON.stringify(tableColumns, null, 2)}`
    );
    const t2 = performance.now();
    console.log(`Finished generating in ${(t2 - t1).toFixed(2)} ms`);
  } catch (err) {
    console.error(err);
  }
}

main();
