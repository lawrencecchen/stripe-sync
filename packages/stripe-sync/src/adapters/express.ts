import { createMiddleware } from "@hattip/adapter-node";
import { createHandler, HandlerOptions } from "../handler";

export const createExpressHandler = (opts: HandlerOptions) =>
  createMiddleware(createHandler(opts));
