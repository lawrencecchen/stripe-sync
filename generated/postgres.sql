create table "stripe"."application" (
  "id" text primary key,
  "name" text,
  "object" text NOT NULL
);

create table "stripe"."customer" (
  "address" jsonb,
  "balance" bigint,
  "cash_balance" jsonb,
  "created" bigint NOT NULL,
  "currency" text,
  "default_source_id" text,
  "delinquent" boolean,
  "description" text,
  "discount" jsonb,
  "email" text,
  "id" text primary key,
  "invoice_prefix" text,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "name" text,
  "next_invoice_sequence" bigint,
  "object" text NOT NULL,
  "phone" text,
  "preferred_locales" jsonb,
  "shipping" jsonb,
  "sources" jsonb,
  "subscriptions" jsonb,
  "tax_exempt" text,
  "tax_ids" jsonb
);

create table "stripe"."three_d_secure" (
  "amount" bigint NOT NULL,
  "authenticated" boolean NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "redirect_url" text,
  "status" text NOT NULL
);

create table "stripe"."account" (
  "business_profile" jsonb,
  "business_type" text,
  "charges_enabled" boolean,
  "country" text,
  "created" bigint,
  "default_currency" text,
  "details_submitted" boolean,
  "email" text,
  "external_accounts" jsonb,
  "id" text primary key,
  "metadata" jsonb,
  "object" text NOT NULL,
  "payouts_enabled" boolean,
  "settings" jsonb,
  "type" text
);

create table "stripe"."capability" (
  "account_id" text,
  "id" text primary key,
  "object" text NOT NULL,
  "requested" boolean NOT NULL,
  "requested_at" bigint,
  "status" text NOT NULL
);

create table "stripe"."bank_account" (
  "account_id" text,
  "account_holder_name" text,
  "account_holder_type" text,
  "account_type" text,
  "available_payout_methods" jsonb,
  "bank_name" text,
  "country" text NOT NULL,
  "currency" text NOT NULL,
  "customer_id" text,
  "default_for_currency" boolean,
  "fingerprint" text,
  "id" text primary key,
  "last4" text NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "routing_number" text,
  "status" text NOT NULL
);

create table "stripe"."person" (
  "account" text NOT NULL,
  "address_kana" jsonb,
  "address_kanji" jsonb,
  "created" bigint NOT NULL,
  "email" text,
  "first_name" text,
  "first_name_kana" text,
  "first_name_kanji" text,
  "full_name_aliases" jsonb,
  "future_requirements" jsonb,
  "gender" text,
  "id" text primary key,
  "id_number_provided" boolean,
  "id_number_secondary_provided" boolean,
  "last_name" text,
  "last_name_kana" text,
  "last_name_kanji" text,
  "maiden_name" text,
  "metadata" jsonb,
  "nationality" text,
  "object" text NOT NULL,
  "phone" text,
  "political_exposure" text,
  "requirements" jsonb,
  "ssn_last_4_provided" boolean
);

create table "stripe"."apple_pay_domain" (
  "created" bigint NOT NULL,
  "domain_name" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL
);

create table "stripe"."application_fee" (
  "account_id" text,
  "amount" bigint NOT NULL,
  "amount_refunded" bigint NOT NULL,
  "application_id" text,
  "balance_transaction_id" text,
  "charge_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "originating_transaction_id" text,
  "refunded" boolean NOT NULL,
  "refunds" jsonb NOT NULL
);

create table "stripe"."fee_refund" (
  "amount" bigint NOT NULL,
  "balance_transaction_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "fee_id" text,
  "id" text primary key,
  "metadata" jsonb,
  "object" text NOT NULL
);

create table "stripe"."apps_secret" (
  "created" bigint NOT NULL,
  "deleted" boolean,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "name" text NOT NULL,
  "object" text NOT NULL,
  "payload" text
);

create table "stripe"."balance" (
  "available" jsonb NOT NULL,
  "connect_reserved" jsonb,
  "instant_available" jsonb,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "pending" jsonb NOT NULL
);

create table "stripe"."balance_transaction" (
  "amount" bigint NOT NULL,
  "available_on" bigint NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text,
  "exchange_rate" decimal,
  "fee" bigint NOT NULL,
  "fee_details" jsonb NOT NULL,
  "id" text primary key,
  "net" bigint NOT NULL,
  "object" text NOT NULL,
  "reporting_category" text NOT NULL,
  "source_id" text,
  "status" text NOT NULL,
  "type" text NOT NULL
);

create table "stripe"."billing_portal_configuration" (
  "active" boolean NOT NULL,
  "application_id" text,
  "created" bigint NOT NULL,
  "default_return_url" text,
  "id" text primary key,
  "is_default" boolean NOT NULL,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "updated" bigint NOT NULL
);

create table "stripe"."bitcoin_receiver" (
  "active" boolean NOT NULL,
  "amount" bigint NOT NULL,
  "amount_received" bigint NOT NULL,
  "bitcoin_amount" bigint NOT NULL,
  "bitcoin_amount_received" bigint NOT NULL,
  "bitcoin_uri" text NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "customer" text,
  "description" text,
  "email" text,
  "filled" boolean NOT NULL,
  "id" text primary key,
  "inbound_address" text NOT NULL,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "payment" text,
  "refund_address" text,
  "transactions" jsonb,
  "uncaptured_funds" boolean NOT NULL,
  "used_for_payment" boolean
);

create table "stripe"."bitcoin_transaction" (
  "amount" bigint NOT NULL,
  "bitcoin_amount" bigint NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "object" text NOT NULL,
  "receiver" text NOT NULL
);

create table "stripe"."charge" (
  "amount" bigint NOT NULL,
  "amount_captured" bigint NOT NULL,
  "amount_refunded" bigint NOT NULL,
  "application_id" text,
  "application_fee_id" text,
  "application_fee_amount" bigint,
  "balance_transaction_id" text,
  "calculated_statement_descriptor" text,
  "captured" boolean NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "customer_id" text,
  "description" text,
  "disputed" boolean NOT NULL,
  "failure_balance_transaction_id" text,
  "failure_code" text,
  "failure_message" text,
  "fraud_details" jsonb,
  "id" text primary key,
  "invoice_id" text,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "on_behalf_of_id" text,
  "outcome" jsonb,
  "paid" boolean NOT NULL,
  "payment_intent_id" text,
  "payment_method" text,
  "payment_method_details" jsonb,
  "receipt_email" text,
  "receipt_number" text,
  "receipt_url" text,
  "refunded" boolean NOT NULL,
  "refunds" jsonb NOT NULL,
  "review_id" text,
  "shipping" jsonb,
  "source_transfer_id" text,
  "statement_descriptor" text,
  "statement_descriptor_suffix" text,
  "status" text NOT NULL,
  "transfer_id" text,
  "transfer_data" jsonb,
  "transfer_group" text
);

create table "stripe"."dispute" (
  "amount" bigint NOT NULL,
  "balance_transactions" jsonb NOT NULL,
  "charge_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "is_charge_refundable" boolean NOT NULL,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "payment_intent_id" text,
  "reason" text NOT NULL,
  "status" text NOT NULL
);

create table "stripe"."refund" (
  "amount" bigint NOT NULL,
  "balance_transaction_id" text,
  "charge_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text,
  "failure_balance_transaction_id" text,
  "failure_reason" text,
  "id" text primary key,
  "instructions_email" text,
  "metadata" jsonb,
  "object" text NOT NULL,
  "payment_intent_id" text,
  "reason" text,
  "receipt_number" text,
  "source_transfer_reversal_id" text,
  "status" text,
  "transfer_reversal_id" text
);

create table "stripe"."checkout_session" (
  "after_expiration" jsonb,
  "allow_promotion_codes" boolean,
  "amount_subtotal" bigint,
  "amount_total" bigint,
  "billing_address_collection" text,
  "cancel_url" text NOT NULL,
  "client_reference_id" text,
  "consent" jsonb,
  "consent_collection" jsonb,
  "currency" text,
  "customer_id" text,
  "customer_creation" text,
  "customer_details" jsonb,
  "customer_email" text,
  "expires_at" bigint NOT NULL,
  "id" text primary key,
  "line_items" jsonb,
  "livemode" boolean NOT NULL,
  "locale" text,
  "metadata" jsonb,
  "mode" text NOT NULL,
  "object" text NOT NULL,
  "payment_intent_id" text,
  "payment_link_id" text,
  "payment_method_options" jsonb,
  "payment_method_types" jsonb NOT NULL,
  "payment_status" text NOT NULL,
  "recovered_from" text,
  "setup_intent_id" text,
  "shipping" jsonb,
  "shipping_address_collection" jsonb,
  "shipping_options" jsonb NOT NULL,
  "shipping_rate_id" text,
  "status" text,
  "submit_type" text,
  "subscription_id" text,
  "success_url" text NOT NULL,
  "total_details" jsonb,
  "url" text
);

create table "stripe"."item" (
  "amount_discount" bigint,
  "amount_subtotal" bigint NOT NULL,
  "amount_tax" bigint,
  "amount_total" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text NOT NULL,
  "discounts" jsonb,
  "id" text primary key,
  "object" text NOT NULL,
  "price" jsonb,
  "product_id" text,
  "quantity" bigint,
  "taxes" jsonb
);

create table "stripe"."country_spec" (
  "default_currency" text NOT NULL,
  "id" text primary key,
  "object" text NOT NULL,
  "supported_bank_account_currencies" jsonb NOT NULL,
  "supported_payment_currencies" jsonb NOT NULL,
  "supported_payment_methods" jsonb NOT NULL,
  "supported_transfer_countries" jsonb NOT NULL
);

create table "stripe"."coupon" (
  "amount_off" bigint,
  "created" bigint NOT NULL,
  "currency" text,
  "duration" text NOT NULL,
  "duration_in_months" bigint,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "max_redemptions" bigint,
  "metadata" jsonb,
  "name" text,
  "object" text NOT NULL,
  "percent_off" decimal,
  "redeem_by" bigint,
  "times_redeemed" bigint NOT NULL,
  "valid" boolean NOT NULL
);

create table "stripe"."credit_note" (
  "amount" bigint NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "customer_id" text,
  "customer_balance_transaction_id" text,
  "discount_amount" bigint NOT NULL,
  "discount_amounts" jsonb NOT NULL,
  "id" text primary key,
  "invoice_id" text,
  "lines" jsonb NOT NULL,
  "livemode" boolean NOT NULL,
  "memo" text,
  "metadata" jsonb,
  "number" text NOT NULL,
  "object" text NOT NULL,
  "out_of_band_amount" bigint,
  "pdf" text NOT NULL,
  "reason" text,
  "refund_id" text,
  "status" text NOT NULL,
  "subtotal" bigint NOT NULL,
  "tax_amounts" jsonb NOT NULL,
  "total" bigint NOT NULL,
  "type" text NOT NULL,
  "voided_at" bigint
);

create table "stripe"."credit_note_line_item" (
  "amount" bigint NOT NULL,
  "description" text,
  "discount_amount" bigint NOT NULL,
  "discount_amounts" jsonb NOT NULL,
  "id" text primary key,
  "invoice_line_item" text,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "quantity" bigint,
  "tax_amounts" jsonb NOT NULL,
  "tax_rates" jsonb NOT NULL,
  "type" text NOT NULL,
  "unit_amount" bigint,
  "unit_amount_decimal" text
);

create table "stripe"."customer_balance_transaction" (
  "amount" bigint NOT NULL,
  "created" bigint NOT NULL,
  "credit_note_id" text,
  "currency" text NOT NULL,
  "customer_id" text,
  "description" text,
  "ending_balance" bigint NOT NULL,
  "id" text primary key,
  "invoice_id" text,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "type" text NOT NULL
);

create table "stripe"."card" (
  "account_id" text,
  "address_city" text,
  "address_country" text,
  "address_line1" text,
  "address_line1_check" text,
  "address_line2" text,
  "address_state" text,
  "address_zip" text,
  "address_zip_check" text,
  "available_payout_methods" jsonb,
  "brand" text NOT NULL,
  "country" text,
  "currency" text,
  "customer_id" text,
  "cvc_check" text,
  "default_for_currency" boolean,
  "dynamic_last4" text,
  "exp_month" bigint NOT NULL,
  "exp_year" bigint NOT NULL,
  "fingerprint" text,
  "funding" text NOT NULL,
  "id" text primary key,
  "last4" text NOT NULL,
  "metadata" jsonb,
  "name" text,
  "object" text NOT NULL,
  "recipient_id" text,
  "status" text,
  "tokenization_method" text
);

create table "stripe"."cash_balance" (
  "available" jsonb,
  "customer" text NOT NULL,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL
);

create table "stripe"."discount" (
  "checkout_session" text,
  "customer_id" text,
  "end" bigint,
  "id" text primary key,
  "invoice" text,
  "invoice_item" text,
  "object" text NOT NULL,
  "promotion_code_id" text,
  "start" bigint NOT NULL,
  "subscription" text
);

create table "stripe"."payment_method" (
  "created" bigint NOT NULL,
  "customer_id" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "type" text NOT NULL
);

create table "stripe"."alipay_account" (
  "created" bigint NOT NULL,
  "customer_id" text,
  "fingerprint" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "payment_amount" bigint,
  "payment_currency" text,
  "reusable" boolean NOT NULL,
  "used" boolean NOT NULL,
  "username" text NOT NULL
);

create table "stripe"."subscription" (
  "application_id" text,
  "application_fee_percent" decimal,
  "billing_cycle_anchor" bigint NOT NULL,
  "billing_thresholds" jsonb,
  "cancel_at" bigint,
  "cancel_at_period_end" boolean NOT NULL,
  "canceled_at" bigint,
  "collection_method" text NOT NULL,
  "created" bigint NOT NULL,
  "current_period_end" bigint NOT NULL,
  "current_period_start" bigint NOT NULL,
  "customer_id" text,
  "days_until_due" bigint,
  "default_payment_method_id" text,
  "default_source_id" text,
  "default_tax_rates" jsonb,
  "description" text,
  "discount" jsonb,
  "ended_at" bigint,
  "id" text primary key,
  "items" jsonb NOT NULL,
  "latest_invoice_id" text,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "next_pending_invoice_item_invoice" bigint,
  "object" text NOT NULL,
  "pause_collection" jsonb,
  "payment_settings" jsonb,
  "pending_invoice_item_interval" jsonb,
  "pending_setup_intent_id" text,
  "pending_update" jsonb,
  "schedule_id" text,
  "start_date" bigint NOT NULL,
  "status" text NOT NULL,
  "transfer_data" jsonb,
  "trial_end" bigint,
  "trial_start" bigint
);

create table "stripe"."tax_id" (
  "country" text,
  "created" bigint NOT NULL,
  "customer_id" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "type" text NOT NULL,
  "value" text NOT NULL,
  "verification" jsonb
);

create table "stripe"."event" (
  "account" text,
  "api_version" text,
  "created" bigint NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "pending_webhooks" bigint NOT NULL,
  "request" jsonb,
  "type" text NOT NULL
);

create table "stripe"."exchange_rate" (
  "id" text primary key,
  "object" text NOT NULL,
  "rates" jsonb NOT NULL
);

create table "stripe"."file_link" (
  "created" bigint NOT NULL,
  "expired" boolean NOT NULL,
  "expires_at" bigint,
  "file_id" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "url" text
);

create table "stripe"."file" (
  "created" bigint NOT NULL,
  "expires_at" bigint,
  "filename" text,
  "id" text primary key,
  "links" jsonb,
  "object" text NOT NULL,
  "purpose" text NOT NULL,
  "size" bigint NOT NULL,
  "title" text,
  "type" text,
  "url" text
);

create table "stripe"."financial_connections_account" (
  "account_holder" jsonb,
  "balance" jsonb,
  "balance_refresh" jsonb,
  "category" text NOT NULL,
  "created" bigint NOT NULL,
  "display_name" text,
  "id" text primary key,
  "institution_name" text NOT NULL,
  "last4" text,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "ownership_id" text,
  "ownership_refresh" jsonb,
  "permissions" jsonb,
  "status" text NOT NULL,
  "subcategory" text NOT NULL,
  "supported_payment_method_types" jsonb NOT NULL
);

create table "stripe"."financial_connections_account_owner" (
  "email" text,
  "id" text primary key,
  "name" text NOT NULL,
  "object" text NOT NULL,
  "ownership" text NOT NULL,
  "phone" text,
  "raw_address" text,
  "refreshed_at" bigint
);

create table "stripe"."financial_connections_session" (
  "account_holder" jsonb,
  "accounts" jsonb NOT NULL,
  "client_secret" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "permissions" jsonb NOT NULL,
  "return_url" text
);

create table "stripe"."identity_verification_report" (
  "created" bigint NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "type" text NOT NULL,
  "verification_session" text
);

create table "stripe"."identity_verification_session" (
  "client_secret" text,
  "created" bigint NOT NULL,
  "id" text primary key,
  "last_error" jsonb,
  "last_verification_report_id" text,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "redaction" jsonb,
  "status" text NOT NULL,
  "type" text NOT NULL,
  "url" text,
  "verified_outputs" jsonb
);

create table "stripe"."invoiceitem" (
  "amount" bigint NOT NULL,
  "currency" text NOT NULL,
  "customer_id" text,
  "date" bigint NOT NULL,
  "description" text,
  "discountable" boolean NOT NULL,
  "discounts" jsonb,
  "id" text primary key,
  "invoice_id" text,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "price" jsonb,
  "proration" boolean NOT NULL,
  "quantity" bigint NOT NULL,
  "subscription_id" text,
  "subscription_item" text,
  "tax_rates" jsonb,
  "unit_amount" bigint,
  "unit_amount_decimal" text
);

create table "stripe"."invoice" (
  "account_country" text,
  "account_name" text,
  "account_tax_ids" jsonb,
  "amount_due" bigint NOT NULL,
  "amount_paid" bigint NOT NULL,
  "amount_remaining" bigint NOT NULL,
  "application_id" text,
  "application_fee_amount" bigint,
  "attempt_count" bigint NOT NULL,
  "attempted" boolean NOT NULL,
  "auto_advance" boolean,
  "billing_reason" text,
  "charge_id" text,
  "collection_method" text NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "custom_fields" jsonb,
  "customer_id" text,
  "customer_address" jsonb,
  "customer_email" text,
  "customer_name" text,
  "customer_phone" text,
  "customer_shipping" jsonb,
  "customer_tax_exempt" text,
  "customer_tax_ids" jsonb,
  "default_payment_method_id" text,
  "default_source_id" text,
  "default_tax_rates" jsonb NOT NULL,
  "description" text,
  "discount" jsonb,
  "discounts" jsonb,
  "due_date" bigint,
  "ending_balance" bigint,
  "footer" text,
  "hosted_invoice_url" text,
  "id" text primary key,
  "invoice_pdf" text,
  "last_finalization_error" jsonb,
  "lines" jsonb NOT NULL,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "next_payment_attempt" bigint,
  "number" text,
  "object" text NOT NULL,
  "on_behalf_of_id" text,
  "paid" boolean NOT NULL,
  "paid_out_of_band" boolean NOT NULL,
  "payment_intent_id" text,
  "period_end" bigint NOT NULL,
  "period_start" bigint NOT NULL,
  "post_payment_credit_notes_amount" bigint NOT NULL,
  "pre_payment_credit_notes_amount" bigint NOT NULL,
  "quote_id" text,
  "receipt_number" text,
  "starting_balance" bigint NOT NULL,
  "statement_descriptor" text,
  "status" text,
  "subscription_id" text,
  "subscription_proration_date" bigint,
  "subtotal" bigint NOT NULL,
  "tax" bigint,
  "total" bigint NOT NULL,
  "total_discount_amounts" jsonb,
  "total_tax_amounts" jsonb NOT NULL,
  "transfer_data" jsonb,
  "webhooks_delivered_at" bigint
);

create table "stripe"."line_item" (
  "amount" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text,
  "discount_amounts" jsonb,
  "discountable" boolean NOT NULL,
  "discounts" jsonb,
  "id" text primary key,
  "invoice_item" text,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "price" jsonb,
  "proration" boolean NOT NULL,
  "proration_details" jsonb,
  "quantity" bigint,
  "subscription" text,
  "subscription_item" text,
  "tax_amounts" jsonb,
  "tax_rates" jsonb,
  "type" text NOT NULL
);

create table "stripe"."issuer_fraud_record" (
  "actionable" boolean NOT NULL,
  "charge_id" text,
  "created" bigint NOT NULL,
  "fraud_type" text NOT NULL,
  "has_liability_shift" boolean NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "post_date" bigint NOT NULL
);

create table "stripe"."issuing_authorization" (
  "amount" bigint NOT NULL,
  "amount_details" jsonb,
  "approved" boolean NOT NULL,
  "authorization_method" text NOT NULL,
  "balance_transactions" jsonb NOT NULL,
  "cardholder_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "merchant_amount" bigint NOT NULL,
  "merchant_currency" text NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "pending_request" jsonb,
  "request_history" jsonb NOT NULL,
  "status" text NOT NULL,
  "transactions" jsonb NOT NULL,
  "treasury" jsonb,
  "wallet" text
);

create table "stripe"."issuing_cardholder" (
  "company" jsonb,
  "created" bigint NOT NULL,
  "email" text,
  "id" text primary key,
  "individual" jsonb,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "name" text NOT NULL,
  "object" text NOT NULL,
  "phone_number" text,
  "spending_controls" jsonb,
  "status" text NOT NULL,
  "type" text NOT NULL
);

create table "stripe"."issuing_card" (
  "brand" text NOT NULL,
  "cancellation_reason" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "cvc" text,
  "exp_month" bigint NOT NULL,
  "exp_year" bigint NOT NULL,
  "financial_account" text,
  "id" text primary key,
  "last4" text NOT NULL,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "number" text,
  "object" text NOT NULL,
  "replaced_by_id" text,
  "replacement_for_id" text,
  "replacement_reason" text,
  "shipping" jsonb,
  "status" text NOT NULL,
  "type" text NOT NULL,
  "wallets" jsonb
);

create table "stripe"."issuing_dispute" (
  "amount" bigint NOT NULL,
  "balance_transactions" jsonb,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "status" text NOT NULL,
  "transaction_id" text,
  "treasury" jsonb
);

create table "stripe"."issuing_settlement" (
  "bin" text NOT NULL,
  "clearing_date" bigint NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "interchange_fees" bigint NOT NULL,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "net_total" bigint NOT NULL,
  "network" text NOT NULL,
  "network_fees" bigint NOT NULL,
  "network_settlement_identifier" text NOT NULL,
  "object" text NOT NULL,
  "settlement_service" text NOT NULL,
  "transaction_count" bigint NOT NULL,
  "transaction_volume" bigint NOT NULL
);

create table "stripe"."issuing_transaction" (
  "amount" bigint NOT NULL,
  "amount_details" jsonb,
  "authorization_id" text,
  "balance_transaction_id" text,
  "card_id" text,
  "cardholder_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "dispute_id" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "merchant_amount" bigint NOT NULL,
  "merchant_currency" text NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "purchase_details" jsonb,
  "treasury" jsonb,
  "type" text NOT NULL,
  "wallet" text
);

create table "stripe"."mandate" (
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "payment_method_id" text,
  "status" text NOT NULL,
  "type" text NOT NULL
);

create table "stripe"."order" (
  "amount_subtotal" bigint NOT NULL,
  "amount_total" bigint NOT NULL,
  "application_id" text,
  "billing_details" jsonb,
  "client_secret" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "customer_id" text,
  "description" text,
  "discounts" jsonb,
  "id" text primary key,
  "ip_address" text,
  "line_items" jsonb,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "shipping_cost" jsonb,
  "shipping_details" jsonb,
  "status" text NOT NULL
);

create table "stripe"."payment_intent" (
  "amount" bigint NOT NULL,
  "amount_capturable" bigint,
  "amount_received" bigint,
  "application_id" text,
  "application_fee_amount" bigint,
  "automatic_payment_methods" jsonb,
  "canceled_at" bigint,
  "cancellation_reason" text,
  "capture_method" text NOT NULL,
  "charges" jsonb,
  "client_secret" text,
  "confirmation_method" text NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "customer_id" text,
  "description" text,
  "id" text primary key,
  "invoice_id" text,
  "last_payment_error" jsonb,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "next_action" jsonb,
  "object" text NOT NULL,
  "on_behalf_of_id" text,
  "payment_method_id" text,
  "payment_method_options" jsonb,
  "payment_method_types" jsonb NOT NULL,
  "processing" jsonb,
  "receipt_email" text,
  "review_id" text,
  "setup_future_usage" text,
  "shipping" jsonb,
  "statement_descriptor" text,
  "statement_descriptor_suffix" text,
  "status" text NOT NULL,
  "transfer_data" jsonb,
  "transfer_group" text
);

create table "stripe"."payment_link" (
  "active" boolean NOT NULL,
  "allow_promotion_codes" boolean NOT NULL,
  "application_fee_amount" bigint,
  "application_fee_percent" decimal,
  "billing_address_collection" text NOT NULL,
  "consent_collection" jsonb,
  "customer_creation" text NOT NULL,
  "id" text primary key,
  "line_items" jsonb,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "on_behalf_of_id" text,
  "payment_intent_data" jsonb,
  "payment_method_types" jsonb,
  "shipping_address_collection" jsonb,
  "shipping_options" jsonb NOT NULL,
  "submit_type" text NOT NULL,
  "subscription_data" jsonb,
  "transfer_data" jsonb,
  "url" text NOT NULL
);

create table "stripe"."payout" (
  "amount" bigint NOT NULL,
  "arrival_date" bigint NOT NULL,
  "automatic" boolean NOT NULL,
  "balance_transaction_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text,
  "destination_id" text,
  "failure_balance_transaction_id" text,
  "failure_code" text,
  "failure_message" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "method" text NOT NULL,
  "object" text NOT NULL,
  "original_payout_id" text,
  "reversed_by_id" text,
  "source_type" text NOT NULL,
  "statement_descriptor" text,
  "status" text NOT NULL,
  "type" text NOT NULL
);

create table "stripe"."plan" (
  "active" boolean NOT NULL,
  "aggregate_usage" text,
  "amount" bigint,
  "amount_decimal" text,
  "billing_scheme" text NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "interval" text NOT NULL,
  "interval_count" bigint NOT NULL,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "nickname" text,
  "object" text NOT NULL,
  "product_id" text,
  "tiers" jsonb,
  "tiers_mode" text,
  "transform_usage" jsonb,
  "trial_period_days" bigint,
  "usage_type" text NOT NULL
);

create table "stripe"."price" (
  "active" boolean NOT NULL,
  "billing_scheme" text NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "custom_unit_amount" jsonb,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "lookup_key" text,
  "metadata" jsonb NOT NULL,
  "nickname" text,
  "object" text NOT NULL,
  "product_id" text,
  "recurring" jsonb,
  "tax_behavior" text,
  "tiers" jsonb,
  "tiers_mode" text,
  "transform_quantity" jsonb,
  "type" text NOT NULL,
  "unit_amount" bigint,
  "unit_amount_decimal" text
);

create table "stripe"."product" (
  "active" boolean NOT NULL,
  "created" bigint NOT NULL,
  "default_price_id" text,
  "description" text,
  "id" text primary key,
  "images" jsonb NOT NULL,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "name" text NOT NULL,
  "object" text NOT NULL,
  "package_dimensions" jsonb,
  "shippable" boolean,
  "statement_descriptor" text,
  "tax_code_id" text,
  "unit_label" text,
  "updated" bigint NOT NULL,
  "url" text
);

create table "stripe"."promotion_code" (
  "active" boolean NOT NULL,
  "code" text NOT NULL,
  "created" bigint NOT NULL,
  "customer_id" text,
  "expires_at" bigint,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "max_redemptions" bigint,
  "metadata" jsonb,
  "object" text NOT NULL,
  "times_redeemed" bigint NOT NULL
);

create table "stripe"."quote" (
  "amount_subtotal" bigint NOT NULL,
  "amount_total" bigint NOT NULL,
  "application_id" text,
  "application_fee_amount" bigint,
  "application_fee_percent" decimal,
  "collection_method" text NOT NULL,
  "created" bigint NOT NULL,
  "currency" text,
  "customer_id" text,
  "default_tax_rates" jsonb,
  "description" text,
  "discounts" jsonb NOT NULL,
  "expires_at" bigint NOT NULL,
  "footer" text,
  "from_quote" jsonb,
  "header" text,
  "id" text primary key,
  "invoice_id" text,
  "invoice_settings" jsonb,
  "line_items" jsonb,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "number" text,
  "object" text NOT NULL,
  "on_behalf_of_id" text,
  "status" text NOT NULL,
  "subscription_id" text,
  "subscription_schedule_id" text,
  "transfer_data" jsonb
);

create table "stripe"."radar_early_fraud_warning" (
  "actionable" boolean NOT NULL,
  "charge_id" text,
  "created" bigint NOT NULL,
  "fraud_type" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "payment_intent_id" text
);

create table "stripe"."radar_value_list_item" (
  "created" bigint NOT NULL,
  "created_by" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "value" text NOT NULL,
  "value_list" text NOT NULL
);

create table "stripe"."radar_value_list" (
  "alias" text NOT NULL,
  "created" bigint NOT NULL,
  "created_by" text NOT NULL,
  "id" text primary key,
  "item_type" text NOT NULL,
  "list_items" jsonb NOT NULL,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "name" text NOT NULL,
  "object" text NOT NULL
);

create table "stripe"."recipient" (
  "active_account" jsonb,
  "cards" jsonb,
  "created" bigint NOT NULL,
  "default_card_id" text,
  "description" text,
  "email" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "migrated_to_id" text,
  "name" text,
  "object" text NOT NULL,
  "rolled_back_from_id" text,
  "type" text NOT NULL
);

create table "stripe"."reporting_report_run" (
  "created" bigint NOT NULL,
  "error" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "report_type" text NOT NULL,
  "result" jsonb,
  "status" text NOT NULL,
  "succeeded_at" bigint
);

create table "stripe"."reporting_report_type" (
  "data_available_end" bigint NOT NULL,
  "data_available_start" bigint NOT NULL,
  "default_columns" jsonb,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "name" text NOT NULL,
  "object" text NOT NULL,
  "updated" bigint NOT NULL,
  "version" bigint NOT NULL
);

create table "stripe"."review" (
  "billing_zip" text,
  "charge_id" text,
  "closed_reason" text,
  "created" bigint NOT NULL,
  "id" text primary key,
  "ip_address" text,
  "ip_address_location" jsonb,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "open" boolean NOT NULL,
  "opened_reason" text NOT NULL,
  "payment_intent_id" text,
  "reason" text NOT NULL,
  "session" jsonb
);

create table "stripe"."setup_attempt" (
  "application_id" text,
  "attach_to_self" boolean,
  "created" bigint NOT NULL,
  "customer_id" text,
  "flow_directions" jsonb,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "on_behalf_of_id" text,
  "payment_method_id" text,
  "setup_error" jsonb,
  "setup_intent_id" text,
  "status" text NOT NULL,
  "usage" text NOT NULL
);

create table "stripe"."setup_intent" (
  "application_id" text,
  "attach_to_self" boolean,
  "cancellation_reason" text,
  "client_secret" text,
  "created" bigint NOT NULL,
  "customer_id" text,
  "description" text,
  "flow_directions" jsonb,
  "id" text primary key,
  "last_setup_error" jsonb,
  "latest_attempt_id" text,
  "livemode" boolean NOT NULL,
  "mandate_id" text,
  "metadata" jsonb,
  "next_action" jsonb,
  "object" text NOT NULL,
  "on_behalf_of_id" text,
  "payment_method_id" text,
  "payment_method_options" jsonb,
  "payment_method_types" jsonb NOT NULL,
  "single_use_mandate_id" text,
  "status" text NOT NULL,
  "usage" text NOT NULL
);

create table "stripe"."shipping_rate" (
  "active" boolean NOT NULL,
  "created" bigint NOT NULL,
  "delivery_estimate" jsonb,
  "display_name" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "tax_behavior" text,
  "tax_code_id" text,
  "type" text NOT NULL
);

create table "stripe"."scheduled_query_run" (
  "created" bigint NOT NULL,
  "data_load_time" bigint NOT NULL,
  "file" jsonb,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "result_available_until" bigint NOT NULL,
  "sql" text NOT NULL,
  "status" text NOT NULL,
  "title" text NOT NULL
);

create table "stripe"."sku" (
  "active" boolean NOT NULL,
  "attributes" jsonb NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "image" text,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "package_dimensions" jsonb,
  "price" bigint NOT NULL,
  "product_id" text,
  "updated" bigint NOT NULL
);

create table "stripe"."source" (
  "amount" bigint,
  "client_secret" text NOT NULL,
  "created" bigint NOT NULL,
  "currency" text,
  "customer" text,
  "flow" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "owner" jsonb,
  "statement_descriptor" text,
  "status" text NOT NULL,
  "type" text NOT NULL,
  "usage" text
);

create table "stripe"."source_mandate_notification" (
  "amount" bigint,
  "created" bigint NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "reason" text NOT NULL,
  "status" text NOT NULL,
  "type" text NOT NULL
);

create table "stripe"."source_transaction" (
  "amount" bigint NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "source" text NOT NULL,
  "status" text NOT NULL,
  "type" text NOT NULL
);

create table "stripe"."subscription_item" (
  "billing_thresholds" jsonb,
  "created" bigint NOT NULL,
  "id" text primary key,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "quantity" bigint,
  "subscription" text NOT NULL,
  "tax_rates" jsonb
);

create table "stripe"."usage_record_summary" (
  "id" text primary key,
  "invoice" text,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "subscription_item" text NOT NULL,
  "total_usage" bigint NOT NULL
);

create table "stripe"."subscription_schedule" (
  "application_id" text,
  "canceled_at" bigint,
  "completed_at" bigint,
  "created" bigint NOT NULL,
  "current_phase" jsonb,
  "customer_id" text,
  "end_behavior" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "phases" jsonb NOT NULL,
  "released_at" bigint,
  "released_subscription" text,
  "status" text NOT NULL,
  "subscription_id" text
);

create table "stripe"."tax_code" (
  "description" text NOT NULL,
  "id" text primary key,
  "name" text NOT NULL,
  "object" text NOT NULL
);

create table "stripe"."tax_rate" (
  "active" boolean NOT NULL,
  "country" text,
  "created" bigint NOT NULL,
  "description" text,
  "display_name" text NOT NULL,
  "id" text primary key,
  "inclusive" boolean NOT NULL,
  "jurisdiction" text,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "percentage" decimal NOT NULL,
  "state" text,
  "tax_type" text
);

create table "stripe"."terminal_configuration" (
  "id" text primary key,
  "is_account_default" boolean,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL
);

create table "stripe"."terminal_location" (
  "configuration_overrides" text,
  "display_name" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL
);

create table "stripe"."terminal_reader" (
  "action" jsonb,
  "device_sw_version" text,
  "device_type" text NOT NULL,
  "id" text primary key,
  "ip_address" text,
  "label" text NOT NULL,
  "livemode" boolean NOT NULL,
  "location_id" text,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "serial_number" text NOT NULL,
  "status" text
);

create table "stripe"."token" (
  "client_ip" text,
  "created" bigint NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "type" text NOT NULL,
  "used" boolean NOT NULL
);

create table "stripe"."topup" (
  "amount" bigint NOT NULL,
  "balance_transaction_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text,
  "expected_availability_date" bigint,
  "failure_code" text,
  "failure_message" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "statement_descriptor" text,
  "status" text NOT NULL,
  "transfer_group" text
);

create table "stripe"."transfer" (
  "amount" bigint NOT NULL,
  "amount_reversed" bigint NOT NULL,
  "balance_transaction_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text,
  "destination_id" text,
  "destination_payment_id" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "reversals" jsonb NOT NULL,
  "reversed" boolean NOT NULL,
  "source_transaction_id" text,
  "source_type" text,
  "transfer_group" text
);

create table "stripe"."transfer_reversal" (
  "amount" bigint NOT NULL,
  "balance_transaction_id" text,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "destination_payment_refund_id" text,
  "id" text primary key,
  "metadata" jsonb,
  "object" text NOT NULL,
  "source_refund_id" text,
  "transfer_id" text
);

create table "stripe"."treasury_credit_reversal" (
  "amount" bigint NOT NULL,
  "currency" text NOT NULL,
  "financial_account" text NOT NULL,
  "hosted_regulatory_receipt_url" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "network" text NOT NULL,
  "object" text NOT NULL,
  "received_credit" text NOT NULL,
  "status" text NOT NULL,
  "transaction_id" text
);

create table "stripe"."treasury_debit_reversal" (
  "amount" bigint NOT NULL,
  "currency" text NOT NULL,
  "financial_account" text,
  "hosted_regulatory_receipt_url" text,
  "id" text primary key,
  "linked_flows" jsonb,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "network" text NOT NULL,
  "object" text NOT NULL,
  "received_debit" text NOT NULL,
  "status" text NOT NULL,
  "transaction_id" text
);

create table "stripe"."treasury_financial_account" (
  "active_features" jsonb NOT NULL,
  "country" text NOT NULL,
  "created" bigint NOT NULL,
  "financial_addresses" jsonb NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb,
  "object" text NOT NULL,
  "pending_features" jsonb NOT NULL,
  "platform_restrictions" jsonb,
  "restricted_features" jsonb NOT NULL,
  "status" text NOT NULL,
  "supported_currencies" jsonb NOT NULL
);

create table "stripe"."treasury_financial_account_features" (
  "object" text NOT NULL
);

create table "stripe"."treasury_inbound_transfer" (
  "amount" bigint NOT NULL,
  "cancelable" boolean NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text,
  "failure_details" jsonb,
  "financial_account" text NOT NULL,
  "hosted_regulatory_receipt_url" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "origin_payment_method" text NOT NULL,
  "origin_payment_method_details" jsonb,
  "returned" boolean,
  "statement_descriptor" text NOT NULL,
  "status" text NOT NULL,
  "transaction_id" text
);

create table "stripe"."treasury_outbound_payment" (
  "amount" bigint NOT NULL,
  "cancelable" boolean NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "customer" text,
  "description" text,
  "destination_payment_method" text,
  "destination_payment_method_details" jsonb,
  "end_user_details" jsonb,
  "expected_arrival_date" bigint NOT NULL,
  "financial_account" text NOT NULL,
  "hosted_regulatory_receipt_url" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "returned_details" jsonb,
  "statement_descriptor" text NOT NULL,
  "status" text NOT NULL,
  "transaction_id" text
);

create table "stripe"."treasury_outbound_transfer" (
  "amount" bigint NOT NULL,
  "cancelable" boolean NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text,
  "destination_payment_method" text NOT NULL,
  "expected_arrival_date" bigint NOT NULL,
  "financial_account" text NOT NULL,
  "hosted_regulatory_receipt_url" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "returned_details" jsonb,
  "statement_descriptor" text NOT NULL,
  "status" text NOT NULL,
  "transaction_id" text
);

create table "stripe"."treasury_received_credit" (
  "amount" bigint NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text NOT NULL,
  "failure_code" text,
  "financial_account" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "network" text NOT NULL,
  "object" text NOT NULL,
  "status" text NOT NULL,
  "transaction_id" text
);

create table "stripe"."treasury_received_debit" (
  "amount" bigint NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text NOT NULL,
  "failure_code" text,
  "financial_account" text,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "network" text NOT NULL,
  "object" text NOT NULL,
  "status" text NOT NULL,
  "transaction_id" text
);

create table "stripe"."treasury_transaction_entry" (
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "effective_at" bigint NOT NULL,
  "financial_account" text NOT NULL,
  "flow" text,
  "flow_details" jsonb,
  "flow_type" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "transaction_id" text,
  "type" text NOT NULL
);

create table "stripe"."treasury_transaction" (
  "amount" bigint NOT NULL,
  "created" bigint NOT NULL,
  "currency" text NOT NULL,
  "description" text NOT NULL,
  "entries" jsonb,
  "financial_account" text NOT NULL,
  "flow" text,
  "flow_details" jsonb,
  "flow_type" text NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "object" text NOT NULL,
  "status" text NOT NULL
);

create table "stripe"."webhook_endpoint" (
  "api_version" text,
  "application" text,
  "created" bigint NOT NULL,
  "description" text,
  "enabled_events" jsonb NOT NULL,
  "id" text primary key,
  "livemode" boolean NOT NULL,
  "metadata" jsonb NOT NULL,
  "object" text NOT NULL,
  "secret" text,
  "status" text NOT NULL,
  "url" text NOT NULL
);

