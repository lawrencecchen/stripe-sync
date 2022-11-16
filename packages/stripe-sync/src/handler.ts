import { type HattipHandler } from "@hattip/core";
import type Stripe from "stripe";
import invariant from "tiny-invariant";
import { STRIPE_EVENT_TABLE_MAP } from "../generated/eventTableMap";
import { STRIPE_TABLES } from "../generated/stripeTables";
import { type DatabaseAdapter } from "./databaseAdapters/createDatabaseAdapter";
import { logger } from "./utils/logger";

export type StripeEventTypes = keyof typeof STRIPE_EVENT_TABLE_MAP;
export type StripeWebhookCallbacks = {
  [type in StripeEventTypes]?: (event: Stripe.Event) => Promise<void> | void;
};

export interface HandlerOptions {
  stripe: Stripe;
  stripeEndpointSecret: string;
  stripeSecretKey: string;
  databaseAdapter?: DatabaseAdapter;
  insertIntoDatabaseFirst?: boolean;
  callbacks?: StripeWebhookCallbacks;
  cryptoProvider?: Stripe.CryptoProvider;
}

function getTableName(event: Stripe.Event) {
  if (!(event.type in STRIPE_EVENT_TABLE_MAP)) {
    throw new Error(`Unknown event type: ${event.type}`);
  }
  return STRIPE_EVENT_TABLE_MAP[event.type];
}

async function saveToDatabase(opts: {
  event: Stripe.Event;
  databaseAdapter: DatabaseAdapter;
}) {
  const { event, databaseAdapter } = opts;
  const object = event.data.object;
  const tableName = getTableName(event);
  invariant(tableName, "missing tableName");
  const columnNames = STRIPE_TABLES[tableName];
  invariant(columnNames, "missing columnNames");
  const fullTableName = opts.databaseAdapter.getFromClause({
    schema: databaseAdapter.schema,
    table: tableName,
  });
  const nonNullData = Object.fromEntries(
    Object.entries(object).filter(
      ([key, value]) => value !== null && columnNames.includes(key)
    )
  );
  await databaseAdapter.upsertRow({
    data: nonNullData,
    fullTableName,
    columnNames,
  });
  logger.log(`Saved ${event.type} to ${fullTableName}. eventId: ${event.id}`);
}

async function dispatchCallback(opts: {
  event: Stripe.Event;
  handlerOpts: HandlerOptions;
}) {
  const { event, handlerOpts } = opts;
  const { callbacks } = handlerOpts;

  if (callbacks?.[event.type]) {
    await callbacks[event.type](event);
  }
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
        const body = await request.text();
        event = await opts.stripe.webhooks.constructEventAsync(
          body,
          signature,
          opts.stripeEndpointSecret,
          undefined,
          opts.cryptoProvider
        );
        event = JSON.parse(body);
      } catch (err: any) {
        logger.log(`⚠️  Webhook signature verification failed `, err.message);
        throw new Response("Invalid signature", {
          status: 401,
        });
      }
      logger.log(`Received triggered ${event.type}. (${event.id})`);
      try {
        const jobs = [] as Array<Promise<any>>;
        if (opts.databaseAdapter) {
          jobs.push(
            saveToDatabase({ event, databaseAdapter: opts.databaseAdapter })
          );
        }
        if (opts.callbacks) {
          jobs.push(dispatchCallback({ event, handlerOpts: opts }));
        }
        if (opts.insertIntoDatabaseFirst) {
          for (const job of jobs) {
            await job;
          }
        } else {
          await Promise.all(jobs);
        }
      } catch (e) {
        logger.error(
          `Error handling ${event.type}`,
          JSON.stringify(e, null, 2)
        );
        return new Response("Error handling event", {
          status: 500,
        });
      }
      return new Response("ok");
    } catch (e) {
      logger.error(JSON.stringify((e as any)?.message, null, 2));
      throw new Response("server error", { status: 500 });
    }
  };
  return handler;
}
