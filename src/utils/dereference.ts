// deno-lint-ignore no-explicit-any
export function dereference(ref: string, obj: any) {
  const parts = ref.replace("#/", "").split("/");
  let current = obj;
  for (const part of parts) {
    current = current?.[part];
  }
  return current;
}
