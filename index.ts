import fs from "fs";

performance.now();
const spec = fs.readFileSync("./openapi/openapi/spec3.json", {
  encoding: "utf-8",
});
console.log(`took ${performance.now()} to read`);
const data = JSON.parse(spec);
console.log(data);
console.log(`took ${performance.now()} to parse`);
