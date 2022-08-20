import type { SupabaseClient } from "@supabase/supabase-js";
import { createDatabaseAdapter } from "./createDatabaseAdapter";

export function createSupabaseAdapter<
  Client extends SupabaseClient<any, string, any>
>(opts: { supabase: Client; schema?: string }) {
  const { supabase, schema } = opts;
  return createDatabaseAdapter({
    schema: schema ?? "stripe",
    upsertRow: async (opts) => {
      const { error } = await supabase
        .from(opts.fullTableName)
        .upsert(opts.data, { onConflict: opts.onConflictColumns?.join(",") });
      if (error) {
        throw error;
      }
    },
    getFromClause: ({ schema, table }) => `${table}`,
  });
}
