import { ensureDirSync } from "https://deno.land/std@0.143.0/fs/mod.ts";
import { mysqlAdapter } from "./src/adapters/mysql.ts";
import { postgresAdapter } from "./src/adapters/postgres.ts";
import { prismaAdapter } from "./src/adapters/prisma.ts";
import {
  schemaRefs,
  schemas,
  stripeSpec,
  webhookEventTypes,
} from "./src/loadSchema.ts";
import type {
  GenerateTableSchemaOptions,
  ResolveColumnContext,
  SchemaKey,
  SchemaObject,
} from "./src/types.ts";
import { dereference } from "./src/utils/dereference.ts";
import { dfsKey } from "./src/utils/dfsKey.ts";
import invariant from "./src/utils/invariant.ts";
import { refToColumnName } from "./src/utils/refToColumnName.ts";

function generateWebhookEventTypes() {
  let result = `export const STRIPE_EVENT_TYPES = [\n`;
  for (const e of webhookEventTypes) {
    result += `  "${e}",\n`;
  }
  result += `] as const`;
  return result;
}

export function getSchema(e: string) {
  let schemaKey = e.split(".").slice(0, -1).join(".") as SchemaKey;
  let schemaObject = schemas[schemaKey] as SchemaObject;
  if (!schemaObject) {
    schemaKey = e
      .split(".")
      .slice(0, -1)
      .join(".")
      .replaceAll("_", ".") as SchemaKey;
    schemaObject = schemas[schemaKey] as SchemaObject;
  }
  if (!schemaObject) {
    schemaKey = e.split(".").slice(1, -1).join(".") as SchemaKey;
    schemaObject = schemas[schemaKey] as SchemaObject;
  }
  if (!schemaObject) {
    schemaKey = e.split(".").slice(0, -1).join("_") as SchemaKey;
    schemaObject = schemas[schemaKey] as SchemaObject;
  }
  if (!schemaObject) {
    console.error(`Schema not found: "${schemaKey}".`, e);
  }

  return { schemaObject, schemaKey };
}

function resolveColumns(context: ResolveColumnContext) {
  const required = new Set<string>(context.schemaObject.required);
  const expandable = new Set<string>(
    context.schemaObject["x-expandableFields"]
  );
  const properties = context.schemaObject.properties;

  if (!properties) {
    return [];
  }
  const fullTableName = context.fullTableName;
  const tableName = context.tableName;
  const columnNames: string[] = [];
  const propertiesEntries = Object.entries(properties);
  for (const [key, property] of propertiesEntries) {
    if (key.startsWith("test_")) {
      continue;
    }
    const isExpandable = expandable.has(key);
    const columnName = context.prefix ? `${context.prefix}_${key}` : key;
    if (key === "id") {
      columnNames.push(
        context.adapter.resolveIdColumn({
          columnName,
          type: "id",
          context,
          fullTableName,
          tableName,
        })
      );
    }
    // else if (isExpandable) {
    //   const dereferencedSchemaObject = dereference(
    //     property["$ref"],
    //     stripeSpec
    //   );

    // }
    else if (isExpandable && property["x-expansionResources"]) {
      const ref = dfsKey(property["x-expansionResources"], "$ref");
      columnNames.push(
        context.adapter.resolveForeignKeyColumn({
          columnName,
          type: "id",
          context,
          fullTableName,
          ref,
          tableName,
        })
      );
    } else if (property["$ref"]) {
      const dereferencedSchemaObject = dereference(
        property["$ref"],
        stripeSpec
      );
      columnNames.concat(
        resolveColumns({
          schemaName: context.schemaName,
          schemaKey: context.schemaKey,
          schemaObject: dereferencedSchemaObject,
          prefix: columnName,
          resolveType: context.resolveType,
          adapter: context.adapter,
          fullTableName,
          ref: property["$ref"],
          tableName,
        })
      );
    } else if (required.has(key)) {
      columnNames.push(
        context.adapter.resolveRequiredColumn({
          columnName,
          type: property.type,
          context,
          fullTableName,
          tableName,
        })
      );
    } else if (isExpandable) {
      columnNames.push(
        context.adapter.resolveOptionalColumn({
          columnName,
          type: "expandable",
          context,
          fullTableName,
          tableName,
        })
      );
    } else if (property.type) {
      columnNames.push(
        context.adapter.resolveOptionalColumn({
          columnName,
          type: property.type,
          context,
          fullTableName,
          tableName,
        })
      );
    } else {
      console.error(`No type found for ${context.schemaKey}.${key}`);
    }
  }
  return columnNames;
}

export function generateSchema(options: GenerateTableSchemaOptions) {
  let result = "";
  for (const ref of schemaRefs) {
    const schemaObject = dereference(ref, stripeSpec);
    const schemaKey = refToColumnName(ref);
    invariant(schemaKey, "schemaKey not found");
    const tableName = schemaKey.replaceAll(".", "_");
    const separator = options.schemaSeparator ?? ".";
    const schemaName = options.schemaName || "<schema>";
    const fullTableName = `${schemaName}${separator}${tableName}`;
    result += options.adapter.resolveCreateTable({
      schemaObject,
      schemaKey,
      schemaSeparator: options.schemaSeparator,
      schemaName,
      adapter: options.adapter,
      fullTableName,
      tableName,
      columns: resolveColumns({
        schemaName,
        schemaKey,
        schemaObject,
        resolveType: options.adapter.resolveType,
        adapter: options.adapter,
        fullTableName,
        ref,
        tableName,
      }),
    });
  }
  return result;
}

function generateTableNames() {
  let result = `export const STRIPE_TABLE_NAMES = [\n`;
  for (const ref of schemaRefs) {
    const schemaKey = refToColumnName(ref);
    invariant(schemaKey, "schemaKey not found");
    const tableName = schemaKey.replaceAll(".", "_");
    result += `  "${tableName}",\n`;
  }
  result += `] as const`;
  return result;
}

function generateEventTableMap() {
  let result = `export const STRIPE_EVENT_TABLE_MAP = {\n`;
  for (const eventType of webhookEventTypes) {
    const foo = eventType.split(".");
    let eventTableName = "";
    if (foo.length === 2) {
      eventTableName = foo[0];
    } else if (foo.length === 3) {
      eventTableName = foo[1];
    } else {
      console.error(
        `Invalid event type: "${eventType}" has ambiguous table name`
      );
      continue;
    }
    result += `  "${eventType}": "${eventTableName}",\n`;
  }
  result += `};`;
  return result;
}

function writeSchema(options: GenerateTableSchemaOptions & { output: string }) {
  const result = generateSchema(options);
  Deno.writeTextFileSync(options.output, result, {
    create: true,
  });
}

function main() {
  const p1 = performance.now();

  const eventTypes = generateWebhookEventTypes();
  ensureDirSync("./generated");
  Deno.writeTextFileSync("./generated/eventTypes.ts", eventTypes, {
    create: true,
  });
  const p2 = performance.now();
  console.log(`Finished generating in ${(p2 - p1) / 1000} s`);

  const tableNames = generateTableNames();
  Deno.writeTextFileSync("./generated/tableNames.ts", tableNames, {
    create: true,
  });

  const eventTableMap = generateEventTableMap();
  Deno.writeTextFileSync("./generated/eventTableMap.ts", eventTableMap, {
    create: true,
  });

  writeSchema({
    output: "./generated/postgres.sql",
    schemaName: "stripe",
    schemaSeparator: ".",
    adapter: postgresAdapter,
  });

  writeSchema({
    output: "./generated/schema.prisma",
    schemaName: "stripe",
    schemaSeparator: "_",
    adapter: prismaAdapter,
  });

  writeSchema({
    output: "./generated/mysql.sql",
    schemaName: "stripe",
    schemaSeparator: "_",
    adapter: mysqlAdapter,
  });

  const p3 = performance.now();
  console.log(`Finished generating all schemas in ${(p3 - p2) / 1000} s`);
}

main();
