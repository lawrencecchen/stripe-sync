import { DatabaseAdapter, ResolveType } from "../types.ts";

const postgresTypeMap = {
  string: "text",
  integer: "bigint",
  number: "decimal",
  boolean: "boolean",
  expandable: "jsonb",
  id: "text",
  object: "jsonb",
  array: "jsonb",
} as Record<ResolveType, string>;

export const postgresAdapter: DatabaseAdapter = {
  resolveIdColumn: (options) =>
    `"${options.columnName}" ${options.context.resolveType(
      options.type
    )} primary key`,
  resolveForeignKeyColumn: (options) =>
    `"${options.columnName}_id" ${options.context.resolveType(options.type)}`,
  resolveRequiredColumn: (options) =>
    `"${options.columnName}" ${options.context.resolveType(
      options.type
    )} NOT NULL`,
  resolveOptionalColumn: (options) =>
    `"${options.columnName}" ${options.context.resolveType(options.type)}`,
  resolveDefaultColumn: (options) =>
    `"${options.columnName}" ${options.context.resolveType(
      options.type
    )} DEFAULT ${options.defaultValue}`,
  resolveCreateTable: (options) => {
    const formattedColumns = options.columns.map((f) => `  ${f}`).join(",\n");
    if (formattedColumns.length === 0) {
      return "";
    }
    // We don't use options.fullTableName here because we want to have "schema"."table" separated with quotes.
    const tableName = options.schemaKey.replaceAll(".", "_");
    const separator = options.schemaSeparator ?? ".";
    const schemaName = options.schemaName || "<schema>";
    return `create table "${schemaName}"${separator}"${tableName}" (\n${formattedColumns}\n);\n\n`;
  },
  resolveType: (type) => {
    if (type in postgresTypeMap) {
      return postgresTypeMap[type];
    }
    console.error(`Unknown type: ${type}. Defaulting to text.`);
    return "text # undefined";
  },
};
