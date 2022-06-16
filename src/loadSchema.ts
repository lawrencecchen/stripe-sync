import type { StripeSpec } from "../spec/spec3.ts";
import { STRIPE_EVENT_TYPES } from "./const.ts";
import { SchemaArray } from "./types.ts";
import { dereference } from "./utils/dereference.ts";
import { dfsKey, dfsKeyAll } from "./utils/dfsKey.ts";

const spec = Deno.readTextFileSync("./openapi/openapi/spec3.json");
export const stripeSpec = JSON.parse(spec) as StripeSpec;

export const schemas = stripeSpec.components.schemas;

const REQUIRED_REFS = [
  "#/components/schemas/application",
  // "#/components/schemas/fee",
  "#/components/schemas/customer",
];

function getSchemaRefs() {
  // Go through all of the paths, [every_path]->get->responses->200->content->application/json->schema->????->$ref
  const refs = new Set<string>(REQUIRED_REFS);

  // function helper(obj: object, depth = 5) {
  //   if (depth === 0) {
  //     return;
  //   }
  //   for (const ref of dfsKeyAll(obj, "$ref")) {
  //     if (refs.has(ref)) {
  //       continue;
  //     }
  //     refs.add(ref);
  //     const dereferenced = dereference(ref, stripeSpec);
  //     helper(dereferenced, depth - 1);
  //   }
  // }
  const paths = Object.keys(stripeSpec.paths);
  for (const path of paths) {
    if (path.startsWith("/v1/test_")) {
      continue;
    }
    const pathObject = stripeSpec.paths[path];
    const get = pathObject.get;
    if (!get) {
      continue;
    }
    if (!get.responses) {
      continue;
    }
    const response = get.responses["200"];
    if (!response) {
      continue;
    }
    if (!response.content) {
      continue;
    }
    const content = response.content["application/json"];
    if (!content) {
      continue;
    }
    if (!content.schema) {
      continue;
    }
    const ref = dfsKey(content.schema, "$ref");
    // const ref = content.schema["$ref"];
    // if (!ref) {
    //   continue;
    // }
    if (refs.has(ref)) {
      continue;
    }
    refs.add(ref);
    // for (const ref of dfsKeyAll(content.schema, "$ref")) {
    //   if (refs.has(ref)) {
    //     continue;
    //   }
    //   refs.add(ref);
    // }
  }
  return refs;
}

export const schemaRefs = getSchemaRefs();
console.log(JSON.stringify([...schemaRefs], null, 4));
console.log(schemaRefs.size);

export const webhookEventTypes2 = stripeSpec.paths[
  "/v1/webhook_endpoints"
].post.requestBody.content[
  "application/x-www-form-urlencoded"
].schema.properties.enabled_events.items.enum.filter(
  // deno-lint-ignore no-explicit-any
  (e: any) => e !== "*"
) as SchemaArray;

export const webhookEventTypes = STRIPE_EVENT_TYPES;
