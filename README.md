# Stripe Sync

Sync Stripe Webhook events directly into your database.

## Setup

### Supabase


#### Add `stripe` schema:

- [postgres.sql](/packages/stripe-sync/generated/postgres.sql)

#### Grant service role permissions

```sql
grant usage on schema stripe to service_role;
grant all privileges on all tables in schema stripe to service_role;
```

#### Deploy

Make sure to pass the `--no-verify-jwt` flat, since we want Stripe to be able to give us POST reqeusts.

```
supabase functions deploy stripe --no-verify-jwt
supabase secrets set --env-file ./supabase/.env
```

- for now, stripe-sync only works on the 2022-08-01 api version. 

#### Limitations

Supabase-js cannot do cross schema joins. This may change, but in the meantime your options are:

1) put all stripe tables in public (with a `stripe_` prefix)
2) use another database client (eg. [Kysely](https://github.com/koskimas/kysely))

## Adapters

- ✅ Supabase Edge Functions
- ✅ Deno (including Deno Deploy)
- ✅ Node.js
- ✅ Cloudflare Workers
- ✅ Express.js
- ✅ Fastify
- ✅ Vercel Serverless Functions
- ✅ Vercel Edge Functions
- ✅ Netlify Functions
- ✅ Netlify Edge Functions
- ✅ Bun

## Comparisons

This project is inspired by all of the projects listed below.

- https://github.com/supabase/stripe-sync-engine
  - Needs a full blown 
  - Can sync only a limited subset of Webhook events as of August 2022
  - Only syncs to Supabase

- https://www.sequin.io/
  - Their stripe sync is pretty pricey, but it's currently more mature/robust
  - Not open source
  - Only syncs to Postgres


## Todos

- [ ] `stripe_` prefix ddl option
- [ ] webhook callback functions for custom logic
- [ ] implement all stripe best practices
  - [ ] make event handling idempotent (https://stripe.com/docs/webhooks/best-practices)
  - [ ] check that request comes from valid ip or is local development (https://stripe.com/files/ips/ips_webhooks.json)
- [ ] next.js adapter
- [ ] remix adapter
- [ ] cloudflare adapter