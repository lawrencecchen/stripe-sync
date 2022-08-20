// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.131.0/http/server.ts";
import Stripe from "https://esm.sh/stripe@9.6.0?target=deno&no-check";
import {
  createDenoHandler,
  createSupabaseAdapter,
} from "https://esm.sh/stripe-sync@0.0.7";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.0.0-rc.3";

const stripe = Stripe(Deno.env.get("STRIPE_API_KEY"), {
  httpClient: Stripe.createFetchHttpClient(),
  apiVersion: "2022-08-01",
});
const cryptoProvider = Stripe.createSubtleCryptoProvider();

export const supabaseClient = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
  {
    db: {
      schema: "stripe",
    },
  }
);

const handler = createDenoHandler({
  databaseAdapter: createSupabaseAdapter({
    supabase: supabaseClient,
  }),
  stripe,
  cryptoProvider,
  stripeEndpointSecret: Deno.env.get("STRIPE_ENDPOINT_SECRET") ?? "",
  stripeSecretKey: Deno.env.get("STRIPE_SK") ?? "",
});

serve(handler);
