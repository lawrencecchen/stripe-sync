# Stripe Sync

how often do we sync?

- the main path relies on webhooks
- each event is stored in an `events` table
- we list `maximumStaleCount` events using `stripe.events.list`
- if the number of stale requested events exceeds `maximumStaleCount`, we will do a full resync using `syncEventsUntil()` until the most recent stored event

## endpoints

POST
/stripe-sync

<!-- /stripe-sync-events -->
