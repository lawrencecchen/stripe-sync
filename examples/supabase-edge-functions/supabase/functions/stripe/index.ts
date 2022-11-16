import { serve } from "https://deno.land/std@0.131.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.1.0";
import { createDenoHandler } from "https://esm.sh/stripe-sync@0.1.3/adapters/deno";
import { createSupabaseAdapter } from "https://esm.sh/stripe-sync@0.1.3/databaseAdapters/supabase";
import Stripe from "https://esm.sh/stripe@10.17.0?target=deno&no-check";
import invariant from "https://esm.sh/tiny-invariant@1.3.1";

const stripe = new Stripe(Deno.env.get("STRIPE_API_KEY"), {
  httpClient: Stripe.createFetchHttpClient(),
  apiVersion: "2022-08-01",
});
const cryptoProvider = Stripe.createSubtleCryptoProvider();

const supabaseUrl = Deno.env.get("SUPABASE_URL");
const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
{
  invariant(typeof supabaseUrl === "string", "SUPABASE_URL is required");
  invariant(
    typeof supabaseServiceKey === "string",
    "SUPABASE_SERVICE_ROLE_KEY is required"
  );
}

export const supabaseClient = createClient(supabaseUrl, supabaseServiceKey, {
  db: {
    schema: "stripe",
  },
});

const handler = createDenoHandler({
  databaseAdapter: createSupabaseAdapter({
    supabase: supabaseClient,
  }),
  stripe,
  cryptoProvider,
  stripeEndpointSecret: Deno.env.get("STRIPE_ENDPOINT_SECRET") ?? "",
  stripeSecretKey: Deno.env.get("STRIPE_SK") ?? "",
  callbacks: {
    "payment_intent.created": (event) => {
      console.log(event);
    },
  },
});

serve(handler);
