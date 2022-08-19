import { HattipHandler } from "@hattip/core";
import Stripe from "stripe";
import { STRIPE_EVENT_TABLE_MAP } from "../generated/eventTableMap";
import { stripeTables } from "../generated/stripeTables";
import { DatabaseAdapter } from "./adapters/createDatabaseAdapter";
import { logger } from "./utils/logger";

export interface HandlerOptions {
  stripe: Stripe;
  stripeEndpointSecret: string;
  stripeSecretKey: string;
  databaseAdapter: DatabaseAdapter;
  cryptoProvider?: Stripe.CryptoProvider;
}

function getTableName(event: Stripe.Event) {
  if (!(event.type in STRIPE_EVENT_TABLE_MAP)) {
    throw new Error(`Unknown event type: ${event.type}`);
  }
  return STRIPE_EVENT_TABLE_MAP[event.type];
}

async function handleEvent(event: Stripe.Event, opts: HandlerOptions) {
  const object = event.data.object;
  const tableName = getTableName(event);
  const columnNames = stripeTables[tableName];
  const fullTableName = opts.databaseAdapter.getFromClause({
    schema: opts.databaseAdapter.schema,
    table: tableName,
  });
  const nonNullData = Object.fromEntries(
    Object.entries(object).filter(
      ([key, value]) => value !== null && columnNames.includes(key)
    )
  );
  await opts.databaseAdapter.upsertRow({
    data: nonNullData,
    fullTableName,
    columnNames,
  });
  logger.log(`Saved ${event.type} to ${fullTableName}. eventId: ${event.id}`);
}

export function createHandler(opts: HandlerOptions) {
  const handler: HattipHandler = async (context) => {
    const { request } = context;
    try {
      if (request.method !== "POST") {
        throw new Error("Only POST requests are allowed");
      }

      const signature = request.headers.get("stripe-signature");
      if (!signature) {
        throw new Error("missing signature header");
      }
      let event: Stripe.Event;
      try {
        // todo: idk if this is the best way to do it. https://github.com/nodejs/undici/issues/1499
        const cloned = request.clone();
        const body = await cloned.text();
        event = await opts.stripe.webhooks.constructEventAsync(
          body,
          signature,
          opts.stripeEndpointSecret,
          undefined,
          opts.cryptoProvider
        );
        event = await request.json();
      } catch (err: any) {
        console.log(err);
        logger.log(`⚠️  Webhook signature verification failed `, err.message);
        throw new Response("Invalid signature", {
          status: 401,
        });
      }
      logger.log(`Received triggered ${event.type}. (${event.id})`);
      try {
        await handleEvent(event, opts);
      } catch (e) {
        logger.error(
          `Error handling ${event.type}`,
          JSON.stringify(e, null, 2)
        );
        throw new Response("Error handling event", {
          status: 500,
        });
      }
      return new Response("ok");
    } catch (e) {
      logger.error(JSON.stringify(e, null, 2));
      throw new Response("server error", { status: 500 });
    }
  };
  return handler;
}
