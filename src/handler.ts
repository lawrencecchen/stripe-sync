import { HattipHandler } from "@hattip/core";

const handler: HattipHandler = async (context) => {
  const { pathname } = new URL(context.request.url);
  if (pathname === "/") {
    return new Response("Hello from HatTip.");
  } else if (pathname === "/about") {
    return new Response(
      "This HTTP handler works in Node.js and Cloudflare Workers."
    );
  } else {
    return new Response("Not found.", { status: 404 });
  }
};

export default handler;
