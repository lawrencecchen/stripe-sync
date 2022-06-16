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

## SQL utils

Drop fake schema SQL generator:

```sql
SET SESSION group_concat_max_len = 999999999; -- MySQL :(
SELECT CONCAT( 'DROP TABLE ', GROUP_CONCAT(table_name) , ';' ) 
    AS statement FROM information_schema.tables 
    WHERE table_name LIKE 'stripe_%';
```

As of 6/16/22, the code above generates
```sql
DROP TABLE stripe_application,stripe_customer,stripe_three_d_secure,stripe_account,stripe_capability,stripe_bank_account,stripe_person,stripe_apple_pay_domain,stripe_application_fee,stripe_fee_refund,stripe_apps_secret,stripe_balance,stripe_balance_transaction,stripe_billing_portal_configuration,stripe_bitcoin_receiver,stripe_bitcoin_transaction,stripe_charge,stripe_dispute,stripe_refund,stripe_checkout_session,stripe_item,stripe_country_spec,stripe_coupon,stripe_credit_note,stripe_credit_note_line_item,stripe_customer_balance_transaction,stripe_card,stripe_cash_balance,stripe_discount,stripe_payment_method,stripe_alipay_account,stripe_subscription,stripe_tax_id,stripe_event,stripe_exchange_rate,stripe_file_link,stripe_file,stripe_financial_connections_account,stripe_financial_connections_account_owner,stripe_financial_connections_session,stripe_identity_verification_report,stripe_identity_verification_session,stripe_invoiceitem,stripe_invoice,stripe_line_item,stripe_issuer_fraud_record,stripe_issuing_authorization,stripe_issuing_cardholder,stripe_issuing_card,stripe_issuing_dispute,stripe_issuing_settlement,stripe_issuing_transaction,stripe_mandate,stripe_order,stripe_payment_intent,stripe_payment_link,stripe_payout,stripe_plan,stripe_price,stripe_product,stripe_promotion_code,stripe_quote,stripe_radar_early_fraud_warning,stripe_radar_value_list_item,stripe_radar_value_list,stripe_recipient,stripe_reporting_report_run,stripe_reporting_report_type,stripe_review,stripe_setup_attempt,stripe_setup_intent,stripe_shipping_rate,stripe_scheduled_query_run,stripe_sku,stripe_source,stripe_source_mandate_notification,stripe_source_transaction,stripe_subscription_item,stripe_usage_record_summary,stripe_subscription_schedule,stripe_tax_code,stripe_tax_rate,stripe_terminal_configuration,stripe_terminal_location,stripe_terminal_reader,stripe_token,stripe_topup,stripe_transfer,stripe_transfer_reversal,stripe_treasury_credit_reversal,stripe_treasury_debit_reversal,stripe_treasury_financial_account,stripe_treasury_financial_account_features,stripe_treasury_inbound_transfer,stripe_treasury_outbound_payment,stripe_treasury_outbound_transfer,stripe_treasury_received_credit,stripe_treasury_received_debit,stripe_treasury_transaction_entry,stripe_treasury_transaction,stripe_webhook_endpoint;
```

https://stackoverflow.com/questions/1589278/sql-deleting-tables-with-prefix
