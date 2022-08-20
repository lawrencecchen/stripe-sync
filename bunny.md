https://swagger.io/docs/specification/data-models/oneof-anyof-allof-not/
https://stripe.com/files/ips/ips_webhooks.json

maybe refetch event?

- https://github.com/supabase/examples/blob/main/supabase-js-v1/edge-functions/supabase/functions/stripe-webhooks/index.ts

## Webhook Progress

- [x] `balance.available`
- [x] `charge.captured`
- [x] `charge.dispute.created`
- [x] `charge.failed`
- [x] `charge.refunded`
- [x] `charge.succeeded`
- [x] `checkout.session.async_payment_failed`
- [x] `checkout.session.async_payment_succeeded`
- [x] `checkout.session.completed`
- [x] `customer.created` 🟢
- [x] `customer.deleted`
- [x] `customer.source.created`
- [x] `customer.source.updated`
- [x] `customer.subscription.created` 🟢
- [x] `customer.subscription.deleted` 🟢
- [x] `customer.subscription.updated` 🟢
- [x] `customer.updated` 🟢
- [x] `invoice.created` 🟢
- [x] `invoice.finalized` 🟢
- [x] `invoice.paid` 🟢
- [x] `invoice.payment_failed` 🟢
- [x] `invoice.payment_succeeded` 🟢
- [x] `invoice.updated` 🟢
- [x] `issuing_authorization.request`
- [x] `issuing_card.created`
- [x] `issuing_cardholder.created`
- [x] `payment_intent.amount_capturable_updated`
- [x] `payment_intent.canceled`
- [x] `payment_intent.created`
- [x] `payment_intent.payment_failed`
- [x] `payment_intent.succeeded`
- [x] `payment_method.attached`
- [x] `plan.created`
- [x] `plan.deleted`
- [x] `plan.updated`
- [x] `price.created` 🟢
- [x] `price.deleted` 🟢
- [x] `price.updated` 🟢
- [x] `product.created` 🟢
- [x] `product.deleted` 🟢
- [x] `product.updated` 🟢
- [x] `setup_intent.canceled`
- [x] `setup_intent.created`
- [x] `setup_intent.setup_failed`
- [x] `setup_intent.succeeded`
- [x] `subscription_schedule.canceled`
- [x] `subscription_schedule.created`
- [x] `subscription_schedule.released`
- [x] `subscription_schedule.updated`
