import { createServer } from "@hattip/adapter-node";
import { createClient } from "@supabase/supabase-js";
import dotenv from "dotenv";
import Stripe from "stripe";
import z from "zod";
import { createSupabaseAdapter } from "./adapters/supabase";
import { createHandler } from "./handler";
dotenv.config();

const port = 5678;

const envParser = z.object({
  STRIPE_SK: z.string(),
  STRIPE_ENDPOINT_SECRET: z.string(),
  SUPABASE_URL: z.string().url(),
  SUPABASE_SERVICE_ROLE_KEY: z.string(),
});
const env = envParser.parse(process.env);

const stripe = new Stripe(env.STRIPE_SK, {
  apiVersion: "2022-08-01",
});

const supabase = createClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY, {
  db: {
    schema: "stripe",
  },
});

const supabaseAdapter = createSupabaseAdapter({
  supabase,
  schema: "stripe",
});

const handler = createHandler({
  stripe: stripe,
  stripeSecretKey: env.STRIPE_SK,
  stripeEndpointSecret: env.STRIPE_ENDPOINT_SECRET,
  databaseAdapter: supabaseAdapter,
});

createServer(handler).listen(port, "localhost", () => {
  console.log(`Server listening on http://localhost:${port}`);
});
