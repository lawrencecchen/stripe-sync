// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.131.0/http/server.ts";
import Stripe from "https://esm.sh/stripe@9.6.0?target=deno&no-check";
import {
  createDenoHandler,
  createSupabaseAdapter,
} from "https://esm.sh/stripe-sync@0.0.2";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.0.0-rc.3";
// import { serve } from "https://esm.sh/@hattip/adapter-deno";

const stripe = Stripe(Deno.env.get("STRIPE_API_KEY"), {
  httpClient: Stripe.createFetchHttpClient(),
});
const cryptoProvider = Stripe.createSubtleCryptoProvider();

export const supabaseClient = createClient(
  // Supabase API URL - env var exported by default when deployed.
  Deno.env.get("SUPABASE_URL") ?? "",
  // Supabase API ANON KEY - env var exported by default when deployed.
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
);

console.log("Hello from Functions!");
console.log("secrets:");
console.log(Deno.env.get("STRIPE_ENDPOINT_SECRET"));
console.log(Deno.env.get("STRIPE_SK"));

const handler = createDenoHandler({
  databaseAdapter: createSupabaseAdapter({
    supabase: supabaseClient,
  }),
  stripe,
  cryptoProvider,
  stripeEndpointSecret: Deno.env.get("STRIPE_ENDPOINT_SECRET") ?? "",
  stripeSecretKey: Deno.env.get("STRIPE_SK") ?? "",
});

serve(handler as any);

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24ifQ.625_WdcF3KHqz5amU0x2X5WWHP-OEs_4qj0ssLNHzTs' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'
