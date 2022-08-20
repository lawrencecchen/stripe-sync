import { createRequestHandler as createDenoRequestHandler } from "@hattip/adapter-deno";
import { createHandler, HandlerOptions } from "../handler";

export type Handler = (
  request: Request,
  connInfo: any
) => Response | Promise<Response>;

export const createStripeSyncHandler = (opts: HandlerOptions) =>
  createDenoRequestHandler(createHandler(opts)) as Handler;
