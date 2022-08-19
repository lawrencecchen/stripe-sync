import { createHandler, HandlerOptions } from "./handler";
import { createMiddleware } from "@hattip/adapter-node";
import { createRequestHandler as createDenoRequestHandler } from "@hattip/adapter-deno";
import { createSupabaseAdapter } from "./adapters/supabase";

const createNodeHandler = (opts: HandlerOptions) => createHandler(opts);
const createExpressHandler = (opts: HandlerOptions) =>
  createMiddleware(createHandler(opts));
const createDenoHandler = (opts: HandlerOptions) =>
  createDenoRequestHandler(createHandler(opts));

export {
  createNodeHandler,
  createExpressHandler,
  createDenoHandler,
  createSupabaseAdapter,
};
