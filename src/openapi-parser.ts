import SwaggerParser from "@apidevtools/swagger-parser";
import invariant from "tiny-invariant";

const SPEC_PATH = "./stripe-openapi/openapi/spec3.json";

function isStringArray(value: any): value is string[] {
  return Array.isArray(value) && value.every((v) => typeof v === "string");
}

function eventToResource(event: string): string {
  const split = event.split(".");
  const resource = split.at(-2);
  // if (!resource) {
  //   console.log(event);
  //   return "oof";
  // }
  invariant(resource);
  return resource;
}

async function main() {
  try {
    console.log("Parsing...");
    const api = await SwaggerParser.parse(SPEC_PATH);
    // console.log("API name: %s, Version: %s", api.info.title, api.info.version);
    // console.log(api);
    const webhookEndpoints = api.paths["/v1/webhook_endpoints"];
    const schema =
      webhookEndpoints["post"]["requestBody"]["content"][
        "application/x-www-form-urlencoded"
      ]["schema"];
    const apiVersions = schema["properties"]["api_version"]["enum"];
    const enabledEvents =
      schema["properties"]["enabled_events"]["items"]["enum"];

    invariant(
      isStringArray(enabledEvents),
      "enabledEvents is not string array"
    );

    // console.log({ schema });
    console.log({ enabledEvents });
    const resources = enabledEvents
      .filter((r) => r !== "*")
      .map(eventToResource);
    console.log({ resources });
  } catch (err) {
    console.error(err);
  }
}

main();
