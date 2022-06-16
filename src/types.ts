import { schemas } from "./loadSchema.ts";

export type SchemaKey = keyof typeof schemas;
export type SchemaArray = Array<SchemaKey>;
export type Schema = typeof schemas[keyof typeof schemas];

export interface DatabaseAdapter {
  resolveIdColumn(options: DatabaseAdapterOptions): string;
  resolveForeignKeyColumn(options: DatabaseAdapterOptions): string;
  resolveRequiredColumn(options: DatabaseAdapterOptions): string;
  resolveOptionalColumn(options: DatabaseAdapterOptions): string;
  resolveDefaultColumn(options: DefaultColumnDatabaseAdapterOptions): string;
  resolveCreateTable(options: ResolveCreateTableOptions): string;
  resolveType(type: ResolveType): string;
}

export interface DatabaseAdapterOptions {
  columnName: string;
  type: ResolveType;
  context: ResolveColumnContext;
  fullTableName: string;
  tableName: string;
  ref?: string;
}

interface DefaultColumnDatabaseAdapterOptions extends DatabaseAdapterOptions {
  defaultValue: string;
}

export interface ResolveColumnContext {
  schemaName: string;
  schemaKey: SchemaKey;
  schemaObject: SchemaObject;
  prefix?: string;
  resolveType: (type: ResolveType) => string;
  adapter: DatabaseAdapter;
  fullTableName: string;
  tableName: string;
  ref?: string;
}

export type ResolveColumnsFn = (options: ResolveColumnContext) => string[];

export interface ResolveCreateTableOptions {
  schemaSeparator: string;
  schemaKey: SchemaKey;
  schemaObject: SchemaObject;
  columns: string[];
  schemaName?: string;
  adapter: DatabaseAdapter;
  fullTableName: string;
  tableName: string;
}
export interface GenerateTableSchemaOptions {
  schemaSeparator: string;
  schemaName?: string;
  adapter: DatabaseAdapter;
}

export type ResolveType =
  | "id"
  | "expandable"
  | "string"
  | "integer"
  | "number"
  | "boolean"
  | "object"
  | "array";

export type SchemaObject = {
  required: string[];
  properties: object;
  "x-expandableFields"?: string[];
} & Record<string, unknown>;
