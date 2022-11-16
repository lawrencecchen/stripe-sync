import Stripe from "stripe";
import { createNextHandler } from "stripe-sync/adapters/next";
import { env } from "../../env/server.mjs";

const stripe = new Stripe(env.STRIPE_SK, {
  apiVersion: "2022-08-01",
});

export default createNextHandler({
  stripe,
  stripeEndpointSecret: env.STRIPE_ENDPOINT_SECRET,
  stripeSecretKey: env.STRIPE_SK,
  callbacks: {
    "payment_intent.created": async (event) => {
      console.log(event);
    },
  },
});

export const config = {
  api: {
    bodyParser: false,
  },
};
