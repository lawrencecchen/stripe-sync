export function refToColumnName(ref: string) {
  return ref.split("/").at(-1)?.replaceAll(".", "_");
}
