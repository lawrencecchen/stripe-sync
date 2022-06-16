# Stripe Sync

## Setup

Create stripe tables in your database

  - [Postgres]("./generated/postgres.sql")
  - [Prisma (has bugs)]("./generated/schema.prisma")
  - MySQL (coming soon)
  - SQLite (coming soon)
  - Others? (PR an adapter!)

## FAQ

- Why aren't there foreign key constraints
  - I'm using planetscale ([no foreign key constraints](https://docs.planetscale.com/learn/operating-without-foreign-key-constraints#how-does-your-schema-look-without-foreign-key-constraints)), and MySQL doesn't have deferrable.

## Sync overview

- the main path relies on webhooks
- each event is stored in an `events` table
- we list `maximumStaleCount` events using `stripe.events.list`
- if the number of stale requested events exceeds `maximumStaleCount`, we will do a full resync using `syncEventsUntil()` until the most recent stored event


## Adapter implementation methods

- handleScheduledFetch(url, scheduledTime)

## Endpoints

POST
/stripe-sync

<!-- /stripe-sync-events -->

## Generate schema

Jus

```bash
deno run --allow-read --allow-write generate.ts
```

## Reference

- https://blog.sequin.io/events-not-webhooks/
- https://github.com/supabase/stripe-sync-engine
