import { assertEquals } from "https://deno.land/std@0.143.0/testing/asserts.ts";
import { generateSchema } from "../generate.ts";
import { postgresAdapter } from "../src/adapters/postgres.ts";

Deno.test("generate postgres is stable", () => {
  const groundTruth = Deno.readTextFileSync("./tests/groundTruth/postgres.sql");
  const output = generateSchema({
    schemaName: "stripe",
    schemaSeparator: ".",
    adapter: postgresAdapter,
  });
  assertEquals(output, groundTruth);
});
