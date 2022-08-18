import { createServer } from "@hattip/adapter-node";
import handler from "./handler";

const port = 5678;

createServer(handler).listen(port, "localhost", () => {
  console.log(`Server listening on http://localhost:${port}`);
});
