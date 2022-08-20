import invariant from "tiny-invariant";

export type Resource = {
  resource: string;
  subresource?: string;
};
export function eventToResource(event: string): Resource {
  if (event.includes("checkout.session")) {
    return {
      resource: "checkout_session",
      subresource: undefined,
    };
  }
  const split = event.split(".");
  const resource = split.at(-2);
  invariant(resource, `Could not find resource for event: ${event}`);
  if (split.length === 2) {
    return {
      resource,
      subresource: undefined,
    };
  }
  if (split.length === 3) {
    return {
      resource,
      subresource: split.at(0),
    };
  }
  throw new Error(`Could not parse event: ${event}`);
}
