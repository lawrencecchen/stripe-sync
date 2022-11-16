import { createHandler, HandlerOptions } from "../handler";

export type Handler = (
  request: Request,
  connInfo: any
) => Response | Promise<Response>;

export const createStripeSyncHandler =
  (opts: HandlerOptions) => (request: Request) =>
    createHandler(opts)({
      request,
      ip: "",
      passThrough: () => ({}),
      platform: "deno",
      waitUntil: () => ({}),
    });
