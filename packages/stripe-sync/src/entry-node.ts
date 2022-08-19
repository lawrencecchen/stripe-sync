import { createServer } from "@hattip/adapter-node";
import { createClient } from "@supabase/supabase-js";
import Stripe from "stripe";
import { createSupabaseAdapter } from "./adapters/supabase";
import { createHandler } from "./handler";
import z from "zod";
import dotenv from "dotenv";
dotenv.config();

const port = 5678;

const envParser = z.object({
  STRIPE_SK: z.string(),
  SUPABASE_URL: z.string().url(),
  SUPABASE_SERVICE_KEY: z.string(),
});
const env = envParser.parse(process.env);

const stripe = new Stripe(env.STRIPE_SK, {
  apiVersion: "2022-08-01",
});

const supabase = createClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_KEY, {
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
  stripeSecretKey:
    "sk_test_51KsEl6CnB3fixYUENqeTA5N92QG87at6bJSrfRiuksrMQaZcl4hLY6JQHQkXm02aSOtov0M4kMn5OlC8EcuQc1kl0091ZQ1J90",
  stripeEndpointSecret:
    "whsec_3d14e74069cb2ea610ce65a6562afc6e89503246019c202ab33a7e3995faa723",
  databaseAdapter: supabaseAdapter,
});

createServer(handler).listen(port, "localhost", () => {
  console.log(`Server listening on http://localhost:${port}`);
});
