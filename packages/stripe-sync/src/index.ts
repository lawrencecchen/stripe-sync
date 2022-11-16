import { createHandler, HandlerOptions } from "./handler";
import { createMiddleware } from "@hattip/adapter-node";
import { createRequestHandler as createDenoRequestHandler } from "@hattip/adapter-deno";
import { createSupabaseAdapter } from "./adapters/supabase";
import type { Handler } from "./entrypoints/deno";

const createNodeHandler = (opts: HandlerOptions) => createHandler(opts);
const createExpressHandler = (opts: HandlerOptions) =>
  createMiddleware(createHandler(opts));
const createDenoHandler = (opts: HandlerOptions) =>
  createDenoRequestHandler(createHandler(opts)) as Handler;
const createFetchHandler = (opts: HandlerOptions) => (request: Request) =>
  createHandler(opts)({
    request,
    ip: "",
    passThrough: () => ({}),
    platform: "",
    waitUntil: () => ({}),
  });

export {
  createNodeHandler,
  createExpressHandler,
  createDenoHandler,
  createSupabaseAdapter,
  createFetchHandler,
};
