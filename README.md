# Stripe Sync

## Setup

```sql
grant usage on schema stripe to service_role;
```

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

## Todos

- [ ] make event handling idempotent (https://stripe.com/docs/webhooks/best-practices)
- [ ] check that request comes from valid ip or is local development (https://stripe.com/files/ips/ips_webhooks.json)
