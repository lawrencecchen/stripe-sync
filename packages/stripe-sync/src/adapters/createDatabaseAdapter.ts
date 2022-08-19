export interface DatabaseAdapter {
  schema: string;
  getFromClause: (opts: { schema: string; table: string }) => string;
  upsertRow(opts: {
    fullTableName: string;
    data: any;
    columnNames: string[];
    onConflictColumns?: string[];
  }): Promise<void>;
}

export function createDatabaseAdapter(opts: DatabaseAdapter) {
  return opts;
}
