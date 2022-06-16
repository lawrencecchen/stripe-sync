import { assertEquals } from "https://deno.land/std@0.143.0/testing/asserts.ts";
import { schemas, stripeSpec } from "../src/loadSchema.ts";
import { dereference } from "../src/utils/dereference.ts";

Deno.test("dereference customer", () => {
  const ref = dereference("#/components/schemas/customer", stripeSpec);
  assertEquals(ref, schemas.customer);
});

Deno.test("dereference invoice", () => {
  const ref = dereference("#/components/schemas/invoice", stripeSpec);
  assertEquals(ref, schemas.invoice);
});

Deno.test("dereference payment_intent", () => {
  const ref = dereference("#/components/schemas/payment_intent", stripeSpec);
  assertEquals(ref, schemas.payment_intent);
});
