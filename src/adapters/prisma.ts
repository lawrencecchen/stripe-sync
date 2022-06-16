import { schemaRefs } from "../loadSchema.ts";
import { DatabaseAdapter, ResolveType } from "../types.ts";
import { refToColumnName } from "../utils/refToColumnName.ts";

const prismaTypeMap = {
  string: "String",
  integer: "BigInt",
  number: "Decimal",
  boolean: "Boolean",
  expandable: "Json",
  id: "String",
  object: "Json",
  array: "Json",
} as Record<ResolveType, string>;

export const prismaAdapter: DatabaseAdapter = {
  resolveIdColumn: (options) =>
    `${options.columnName} ${options.context.resolveType(options.type)} @id`,
  resolveForeignKeyColumn: (options) => {
    const schemaName = `${options.context.schemaName}_`;
    const relationExists = options.ref && schemaRefs.has(options.ref);
    const refColumnName = options.ref && refToColumnName(options.ref);
    // const relationName = refColumnName === options.columnName ?
    const relationField = relationExists
      ? `\n  ${options.columnName} ${schemaName}${refColumnName}? @relation(name: "${options.tableName}_${options.columnName}_to_${refColumnName}", fields: [${options.columnName}_id], references: [id])`
      : "";

    const result =
      `${options.columnName}_id ${options.context.resolveType(options.type)}?` +
      relationField;
    if (!relationExists) {
      console.log(`No relation found for ${options.ref}. Result: ${result}`);
    }

    return result;
  },
  resolveRequiredColumn: (options) =>
    `${options.columnName} ${options.context.resolveType(options.type)}`,
  resolveOptionalColumn: (options) =>
    `${options.columnName} ${options.context.resolveType(options.type)}?`,
  resolveDefaultColumn: (options) => {
    const defaultValue =
      typeof options.defaultValue === "string"
        ? `"${options.defaultValue}"`
        : options.defaultValue;
    return `${options.columnName} ${options.context.resolveType(
      options.type
    )} @default(${defaultValue})`;
  },
  resolveCreateTable: (options) => {
    const formattedColumns = options.columns.map((f) => `  ${f}`).join("\n");
    if (formattedColumns.length === 0) {
      return "";
    }
    return `model ${options.fullTableName} {\n${formattedColumns}\n}\n\n`;
  },
  resolveType: (type) => {
    if (type in prismaTypeMap) {
      return prismaTypeMap[type];
    }
    console.error(`Unknown type: ${type}. Defaulting to text.`);
    return "text # undefined";
  },
};
