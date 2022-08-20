import fs from "node:fs";
import util from "node:util";
import child from "node:child_process";

const exec = util.promisify(child.exec);

const sleep = (ms: number) => new Promise((res) => setTimeout(res, ms));

const unsupportedEvents = new Array<string>();

async function main() {
  const _events = fs.readFileSync("./spec/enabledEvents.txt", "utf-8");
  const events = _events.split("\n").filter((e) => e !== "*");
  for (const event of events) {
    const command = `stripe trigger ${event}`;
    try {
      const { stdout, stderr } = await exec(command);
      console.log(stdout, stderr);
      await sleep(500);
    } catch (e) {
      unsupportedEvents.push(event);
      console.log(`${event} is not supported by the stripe cli.`);
      // console.error(e);
    }
  }
}

main();
