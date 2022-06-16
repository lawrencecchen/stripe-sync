create table `stripe_application` (
  `id` varchar(191) primary key,
  `name` text,
  `object` text NOT NULL
);

create table `stripe_customer` (
  `address` json,
  `balance` bigint,
  `cash_balance` json,
  `created` bigint NOT NULL,
  `currency` text,
  `default_source_id` varchar(191),
  `delinquent` boolean,
  `description` text,
  `discount` json,
  `email` text,
  `id` varchar(191) primary key,
  `invoice_prefix` text,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `name` text,
  `next_invoice_sequence` bigint,
  `object` text NOT NULL,
  `phone` text,
  `preferred_locales` json,
  `shipping` json,
  `sources` json,
  `subscriptions` json,
  `tax_exempt` text,
  `tax_ids` json
);

create table `stripe_three_d_secure` (
  `amount` bigint NOT NULL,
  `authenticated` boolean NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `redirect_url` text,
  `status` text NOT NULL
);

create table `stripe_account` (
  `business_profile` json,
  `business_type` text,
  `charges_enabled` boolean,
  `country` text,
  `created` bigint,
  `default_currency` text,
  `details_submitted` boolean,
  `email` text,
  `external_accounts` json,
  `id` varchar(191) primary key,
  `metadata` json,
  `object` text NOT NULL,
  `payouts_enabled` boolean,
  `settings` json,
  `type` text
);

create table `stripe_capability` (
  `account_id` varchar(191),
  `id` varchar(191) primary key,
  `object` text NOT NULL,
  `requested` boolean NOT NULL,
  `requested_at` bigint,
  `status` text NOT NULL
);

create table `stripe_person` (
  `account` text NOT NULL,
  `address_kana` json,
  `address_kanji` json,
  `created` bigint NOT NULL,
  `email` text,
  `first_name` text,
  `first_name_kana` text,
  `first_name_kanji` text,
  `full_name_aliases` json,
  `future_requirements` json,
  `gender` text,
  `id` varchar(191) primary key,
  `id_number_provided` boolean,
  `id_number_secondary_provided` boolean,
  `last_name` text,
  `last_name_kana` text,
  `last_name_kanji` text,
  `maiden_name` text,
  `metadata` json,
  `nationality` text,
  `object` text NOT NULL,
  `phone` text,
  `political_exposure` text,
  `requirements` json,
  `ssn_last_4_provided` boolean
);

create table `stripe_apple_pay_domain` (
  `created` bigint NOT NULL,
  `domain_name` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL
);

create table `stripe_fee_refund` (
  `amount` bigint NOT NULL,
  `balance_transaction_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `fee_id` varchar(191),
  `id` varchar(191) primary key,
  `metadata` json,
  `object` text NOT NULL
);

create table `stripe_application_fee` (
  `account_id` varchar(191),
  `amount` bigint NOT NULL,
  `amount_refunded` bigint NOT NULL,
  `application_id` varchar(191),
  `balance_transaction_id` varchar(191),
  `charge_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `originating_transaction_id` varchar(191),
  `refunded` boolean NOT NULL,
  `refunds` json NOT NULL
);

create table `stripe_apps_secret` (
  `created` bigint NOT NULL,
  `deleted` boolean,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `name` text NOT NULL,
  `object` text NOT NULL,
  `payload` text
);

create table `stripe_balance` (
  `available` json NOT NULL,
  `connect_reserved` json,
  `instant_available` json,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `pending` json NOT NULL
);

create table `stripe_balance_transaction` (
  `amount` bigint NOT NULL,
  `available_on` bigint NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text,
  `exchange_rate` decimal,
  `fee` bigint NOT NULL,
  `fee_details` json NOT NULL,
  `id` varchar(191) primary key,
  `net` bigint NOT NULL,
  `object` text NOT NULL,
  `reporting_category` text NOT NULL,
  `source_id` varchar(191),
  `status` text NOT NULL,
  `type` text NOT NULL
);

create table `stripe_billing_portal_configuration` (
  `active` boolean NOT NULL,
  `application_id` varchar(191),
  `created` bigint NOT NULL,
  `default_return_url` text,
  `id` varchar(191) primary key,
  `is_default` boolean NOT NULL,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `updated` bigint NOT NULL
);

create table `stripe_bitcoin_receiver` (
  `active` boolean NOT NULL,
  `amount` bigint NOT NULL,
  `amount_received` bigint NOT NULL,
  `bitcoin_amount` bigint NOT NULL,
  `bitcoin_amount_received` bigint NOT NULL,
  `bitcoin_uri` text NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `customer` text,
  `description` text,
  `email` text,
  `filled` boolean NOT NULL,
  `id` varchar(191) primary key,
  `inbound_address` text NOT NULL,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `payment` text,
  `refund_address` text,
  `transactions` json,
  `uncaptured_funds` boolean NOT NULL,
  `used_for_payment` boolean
);

create table `stripe_charge` (
  `amount` bigint NOT NULL,
  `amount_captured` bigint NOT NULL,
  `amount_refunded` bigint NOT NULL,
  `application_id` varchar(191),
  `application_fee_id` varchar(191),
  `application_fee_amount` bigint,
  `balance_transaction_id` varchar(191),
  `calculated_statement_descriptor` text,
  `captured` boolean NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `customer_id` varchar(191),
  `description` text,
  `disputed` boolean NOT NULL,
  `failure_balance_transaction_id` varchar(191),
  `failure_code` text,
  `failure_message` text,
  `fraud_details` json,
  `id` varchar(191) primary key,
  `invoice_id` varchar(191),
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `on_behalf_of_id` varchar(191),
  `outcome` json,
  `paid` boolean NOT NULL,
  `payment_intent_id` varchar(191),
  `payment_method` text,
  `payment_method_details` json,
  `receipt_email` text,
  `receipt_number` text,
  `receipt_url` text,
  `refunded` boolean NOT NULL,
  `refunds` json NOT NULL,
  `review_id` varchar(191),
  `shipping` json,
  `source_transfer_id` varchar(191),
  `statement_descriptor` text,
  `statement_descriptor_suffix` text,
  `status` text NOT NULL,
  `transfer_id` varchar(191),
  `transfer_data` json,
  `transfer_group` text
);

create table `stripe_dispute` (
  `amount` bigint NOT NULL,
  `balance_transactions` json NOT NULL,
  `charge_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `id` varchar(191) primary key,
  `is_charge_refundable` boolean NOT NULL,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `payment_intent_id` varchar(191),
  `reason` text NOT NULL,
  `status` text NOT NULL
);

create table `stripe_refund` (
  `amount` bigint NOT NULL,
  `balance_transaction_id` varchar(191),
  `charge_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text,
  `failure_balance_transaction_id` varchar(191),
  `failure_reason` text,
  `id` varchar(191) primary key,
  `instructions_email` text,
  `metadata` json,
  `object` text NOT NULL,
  `payment_intent_id` varchar(191),
  `reason` text,
  `receipt_number` text,
  `source_transfer_reversal_id` varchar(191),
  `status` text,
  `transfer_reversal_id` varchar(191)
);

create table `stripe_checkout_session` (
  `after_expiration` json,
  `allow_promotion_codes` boolean,
  `amount_subtotal` bigint,
  `amount_total` bigint,
  `billing_address_collection` text,
  `cancel_url` text NOT NULL,
  `client_reference_id` text,
  `consent` json,
  `consent_collection` json,
  `currency` text,
  `customer_id` varchar(191),
  `customer_creation` text,
  `customer_details` json,
  `customer_email` text,
  `expires_at` bigint NOT NULL,
  `id` varchar(191) primary key,
  `line_items` json,
  `livemode` boolean NOT NULL,
  `locale` text,
  `metadata` json,
  `mode` text NOT NULL,
  `object` text NOT NULL,
  `payment_intent_id` varchar(191),
  `payment_link_id` varchar(191),
  `payment_method_options` json,
  `payment_method_types` json NOT NULL,
  `payment_status` text NOT NULL,
  `recovered_from` text,
  `setup_intent_id` varchar(191),
  `shipping` json,
  `shipping_address_collection` json,
  `shipping_options` json NOT NULL,
  `shipping_rate_id` varchar(191),
  `status` text,
  `submit_type` text,
  `subscription_id` varchar(191),
  `success_url` text NOT NULL,
  `total_details` json,
  `url` text
);

create table `stripe_country_spec` (
  `default_currency` text NOT NULL,
  `id` varchar(191) primary key,
  `object` text NOT NULL,
  `supported_bank_account_currencies` json NOT NULL,
  `supported_payment_currencies` json NOT NULL,
  `supported_payment_methods` json NOT NULL,
  `supported_transfer_countries` json NOT NULL
);

create table `stripe_coupon` (
  `amount_off` bigint,
  `created` bigint NOT NULL,
  `currency` text,
  `duration` text NOT NULL,
  `duration_in_months` bigint,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `max_redemptions` bigint,
  `metadata` json,
  `name` text,
  `object` text NOT NULL,
  `percent_off` decimal,
  `redeem_by` bigint,
  `times_redeemed` bigint NOT NULL,
  `valid` boolean NOT NULL
);

create table `stripe_credit_note` (
  `amount` bigint NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `customer_id` varchar(191),
  `customer_balance_transaction_id` varchar(191),
  `discount_amount` bigint NOT NULL,
  `discount_amounts` json NOT NULL,
  `id` varchar(191) primary key,
  `invoice_id` varchar(191),
  `lines` json NOT NULL,
  `livemode` boolean NOT NULL,
  `memo` text,
  `metadata` json,
  `number` text NOT NULL,
  `object` text NOT NULL,
  `out_of_band_amount` bigint,
  `pdf` text NOT NULL,
  `reason` text,
  `refund_id` varchar(191),
  `status` text NOT NULL,
  `subtotal` bigint NOT NULL,
  `tax_amounts` json NOT NULL,
  `total` bigint NOT NULL,
  `type` text NOT NULL,
  `voided_at` bigint
);

create table `stripe_customer_balance_transaction` (
  `amount` bigint NOT NULL,
  `created` bigint NOT NULL,
  `credit_note_id` varchar(191),
  `currency` text NOT NULL,
  `customer_id` varchar(191),
  `description` text,
  `ending_balance` bigint NOT NULL,
  `id` varchar(191) primary key,
  `invoice_id` varchar(191),
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `type` text NOT NULL
);

create table `stripe_bank_account` (
  `account_id` varchar(191),
  `account_holder_name` text,
  `account_holder_type` text,
  `account_type` text,
  `available_payout_methods` json,
  `bank_name` text,
  `country` text NOT NULL,
  `currency` text NOT NULL,
  `customer_id` varchar(191),
  `default_for_currency` boolean,
  `fingerprint` text,
  `id` varchar(191) primary key,
  `last4` text NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `routing_number` text,
  `status` text NOT NULL
);

create table `stripe_card` (
  `account_id` varchar(191),
  `address_city` text,
  `address_country` text,
  `address_line1` text,
  `address_line1_check` text,
  `address_line2` text,
  `address_state` text,
  `address_zip` text,
  `address_zip_check` text,
  `available_payout_methods` json,
  `brand` text NOT NULL,
  `country` text,
  `currency` text,
  `customer_id` varchar(191),
  `cvc_check` text,
  `default_for_currency` boolean,
  `dynamic_last4` text,
  `exp_month` bigint NOT NULL,
  `exp_year` bigint NOT NULL,
  `fingerprint` text,
  `funding` text NOT NULL,
  `id` varchar(191) primary key,
  `last4` text NOT NULL,
  `metadata` json,
  `name` text,
  `object` text NOT NULL,
  `recipient_id` varchar(191),
  `status` text,
  `tokenization_method` text
);

create table `stripe_cash_balance` (
  `available` json,
  `customer` text NOT NULL,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL
);

create table `stripe_discount` (
  `checkout_session` text,
  `customer_id` varchar(191),
  `end` bigint,
  `id` varchar(191) primary key,
  `invoice` text,
  `invoice_item` text,
  `object` text NOT NULL,
  `promotion_code_id` varchar(191),
  `start` bigint NOT NULL,
  `subscription` text
);

create table `stripe_payment_method` (
  `created` bigint NOT NULL,
  `customer_id` varchar(191),
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `type` text NOT NULL
);

create table `stripe_subscription` (
  `application_id` varchar(191),
  `application_fee_percent` decimal,
  `billing_cycle_anchor` bigint NOT NULL,
  `billing_thresholds` json,
  `cancel_at` bigint,
  `cancel_at_period_end` boolean NOT NULL,
  `canceled_at` bigint,
  `collection_method` text NOT NULL,
  `created` bigint NOT NULL,
  `current_period_end` bigint NOT NULL,
  `current_period_start` bigint NOT NULL,
  `customer_id` varchar(191),
  `days_until_due` bigint,
  `default_payment_method_id` varchar(191),
  `default_source_id` varchar(191),
  `default_tax_rates` json,
  `description` text,
  `discount` json,
  `ended_at` bigint,
  `id` varchar(191) primary key,
  `items` json NOT NULL,
  `latest_invoice_id` varchar(191),
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `next_pending_invoice_item_invoice` bigint,
  `object` text NOT NULL,
  `pause_collection` json,
  `payment_settings` json,
  `pending_invoice_item_interval` json,
  `pending_setup_intent_id` varchar(191),
  `pending_update` json,
  `schedule_id` varchar(191),
  `start_date` bigint NOT NULL,
  `status` text NOT NULL,
  `transfer_data` json,
  `trial_end` bigint,
  `trial_start` bigint
);

create table `stripe_tax_id` (
  `country` text,
  `created` bigint NOT NULL,
  `customer_id` varchar(191),
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `type` text NOT NULL,
  `value` text NOT NULL,
  `verification` json
);

create table `stripe_event` (
  `account` text,
  `api_version` text,
  `created` bigint NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `pending_webhooks` bigint NOT NULL,
  `request` json,
  `type` text NOT NULL
);

create table `stripe_exchange_rate` (
  `id` varchar(191) primary key,
  `object` text NOT NULL,
  `rates` json NOT NULL
);

create table `stripe_file_link` (
  `created` bigint NOT NULL,
  `expired` boolean NOT NULL,
  `expires_at` bigint,
  `file_id` varchar(191),
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `url` text
);

create table `stripe_file` (
  `created` bigint NOT NULL,
  `expires_at` bigint,
  `filename` text,
  `id` varchar(191) primary key,
  `links` json,
  `object` text NOT NULL,
  `purpose` text NOT NULL,
  `size` bigint NOT NULL,
  `title` text,
  `type` text,
  `url` text
);

create table `stripe_financial_connections_account` (
  `account_holder` json,
  `balance` json,
  `balance_refresh` json,
  `category` text NOT NULL,
  `created` bigint NOT NULL,
  `display_name` text,
  `id` varchar(191) primary key,
  `institution_name` text NOT NULL,
  `last4` text,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `ownership_id` varchar(191),
  `ownership_refresh` json,
  `permissions` json,
  `status` text NOT NULL,
  `subcategory` text NOT NULL,
  `supported_payment_method_types` json NOT NULL
);

create table `stripe_financial_connections_session` (
  `account_holder` json,
  `accounts` json NOT NULL,
  `client_secret` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `permissions` json NOT NULL,
  `return_url` text
);

create table `stripe_identity_verification_report` (
  `created` bigint NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `type` text NOT NULL,
  `verification_session` text
);

create table `stripe_identity_verification_session` (
  `client_secret` text,
  `created` bigint NOT NULL,
  `id` varchar(191) primary key,
  `last_error` json,
  `last_verification_report_id` varchar(191),
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `redaction` json,
  `status` text NOT NULL,
  `type` text NOT NULL,
  `url` text,
  `verified_outputs` json
);

create table `stripe_invoiceitem` (
  `amount` bigint NOT NULL,
  `currency` text NOT NULL,
  `customer_id` varchar(191),
  `date` bigint NOT NULL,
  `description` text,
  `discountable` boolean NOT NULL,
  `discounts` json,
  `id` varchar(191) primary key,
  `invoice_id` varchar(191),
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `price` json,
  `proration` boolean NOT NULL,
  `quantity` bigint NOT NULL,
  `subscription_id` varchar(191),
  `subscription_item` text,
  `tax_rates` json,
  `unit_amount` bigint,
  `unit_amount_decimal` text
);

create table `stripe_invoice` (
  `account_country` text,
  `account_name` text,
  `account_tax_ids` json,
  `amount_due` bigint NOT NULL,
  `amount_paid` bigint NOT NULL,
  `amount_remaining` bigint NOT NULL,
  `application_id` varchar(191),
  `application_fee_amount` bigint,
  `attempt_count` bigint NOT NULL,
  `attempted` boolean NOT NULL,
  `auto_advance` boolean,
  `billing_reason` text,
  `charge_id` varchar(191),
  `collection_method` text NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `custom_fields` json,
  `customer_id` varchar(191),
  `customer_address` json,
  `customer_email` text,
  `customer_name` text,
  `customer_phone` text,
  `customer_shipping` json,
  `customer_tax_exempt` text,
  `customer_tax_ids` json,
  `default_payment_method_id` varchar(191),
  `default_source_id` varchar(191),
  `default_tax_rates` json NOT NULL,
  `description` text,
  `discount` json,
  `discounts` json,
  `due_date` bigint,
  `ending_balance` bigint,
  `footer` text,
  `hosted_invoice_url` text,
  `id` varchar(191) primary key,
  `invoice_pdf` text,
  `last_finalization_error` json,
  `lines` json NOT NULL,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `next_payment_attempt` bigint,
  `number` text,
  `object` text NOT NULL,
  `on_behalf_of_id` varchar(191),
  `paid` boolean NOT NULL,
  `paid_out_of_band` boolean NOT NULL,
  `payment_intent_id` varchar(191),
  `period_end` bigint NOT NULL,
  `period_start` bigint NOT NULL,
  `post_payment_credit_notes_amount` bigint NOT NULL,
  `pre_payment_credit_notes_amount` bigint NOT NULL,
  `quote_id` varchar(191),
  `receipt_number` text,
  `starting_balance` bigint NOT NULL,
  `statement_descriptor` text,
  `status` text,
  `subscription_id` varchar(191),
  `subscription_proration_date` bigint,
  `subtotal` bigint NOT NULL,
  `tax` bigint,
  `total` bigint NOT NULL,
  `total_discount_amounts` json,
  `total_tax_amounts` json NOT NULL,
  `transfer_data` json,
  `webhooks_delivered_at` bigint
);

create table `stripe_issuer_fraud_record` (
  `actionable` boolean NOT NULL,
  `charge_id` varchar(191),
  `created` bigint NOT NULL,
  `fraud_type` text NOT NULL,
  `has_liability_shift` boolean NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `post_date` bigint NOT NULL
);

create table `stripe_issuing_authorization` (
  `amount` bigint NOT NULL,
  `amount_details` json,
  `approved` boolean NOT NULL,
  `authorization_method` text NOT NULL,
  `balance_transactions` json NOT NULL,
  `cardholder_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `merchant_amount` bigint NOT NULL,
  `merchant_currency` text NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `pending_request` json,
  `request_history` json NOT NULL,
  `status` text NOT NULL,
  `transactions` json NOT NULL,
  `treasury` json,
  `wallet` text
);

create table `stripe_issuing_cardholder` (
  `company` json,
  `created` bigint NOT NULL,
  `email` text,
  `id` varchar(191) primary key,
  `individual` json,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `name` text NOT NULL,
  `object` text NOT NULL,
  `phone_number` text,
  `spending_controls` json,
  `status` text NOT NULL,
  `type` text NOT NULL
);

create table `stripe_issuing_card` (
  `brand` text NOT NULL,
  `cancellation_reason` text,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `cvc` text,
  `exp_month` bigint NOT NULL,
  `exp_year` bigint NOT NULL,
  `financial_account` text,
  `id` varchar(191) primary key,
  `last4` text NOT NULL,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `number` text,
  `object` text NOT NULL,
  `replaced_by_id` varchar(191),
  `replacement_for_id` varchar(191),
  `replacement_reason` text,
  `shipping` json,
  `status` text NOT NULL,
  `type` text NOT NULL,
  `wallets` json
);

create table `stripe_issuing_dispute` (
  `amount` bigint NOT NULL,
  `balance_transactions` json,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `status` text NOT NULL,
  `transaction_id` varchar(191),
  `treasury` json
);

create table `stripe_issuing_settlement` (
  `bin` text NOT NULL,
  `clearing_date` bigint NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `id` varchar(191) primary key,
  `interchange_fees` bigint NOT NULL,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `net_total` bigint NOT NULL,
  `network` text NOT NULL,
  `network_fees` bigint NOT NULL,
  `network_settlement_identifier` text NOT NULL,
  `object` text NOT NULL,
  `settlement_service` text NOT NULL,
  `transaction_count` bigint NOT NULL,
  `transaction_volume` bigint NOT NULL
);

create table `stripe_issuing_transaction` (
  `amount` bigint NOT NULL,
  `amount_details` json,
  `authorization_id` varchar(191),
  `balance_transaction_id` varchar(191),
  `card_id` varchar(191),
  `cardholder_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `dispute_id` varchar(191),
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `merchant_amount` bigint NOT NULL,
  `merchant_currency` text NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `purchase_details` json,
  `treasury` json,
  `type` text NOT NULL,
  `wallet` text
);

create table `stripe_mandate` (
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `payment_method_id` varchar(191),
  `status` text NOT NULL,
  `type` text NOT NULL
);

create table `stripe_order` (
  `amount_subtotal` bigint NOT NULL,
  `amount_total` bigint NOT NULL,
  `application_id` varchar(191),
  `billing_details` json,
  `client_secret` text,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `customer_id` varchar(191),
  `description` text,
  `discounts` json,
  `id` varchar(191) primary key,
  `ip_address` text,
  `line_items` json,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `shipping_cost` json,
  `shipping_details` json,
  `status` text NOT NULL
);

create table `stripe_payment_intent` (
  `amount` bigint NOT NULL,
  `amount_capturable` bigint,
  `amount_received` bigint,
  `application_id` varchar(191),
  `application_fee_amount` bigint,
  `automatic_payment_methods` json,
  `canceled_at` bigint,
  `cancellation_reason` text,
  `capture_method` text NOT NULL,
  `charges` json,
  `client_secret` text,
  `confirmation_method` text NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `customer_id` varchar(191),
  `description` text,
  `id` varchar(191) primary key,
  `invoice_id` varchar(191),
  `last_payment_error` json,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `next_action` json,
  `object` text NOT NULL,
  `on_behalf_of_id` varchar(191),
  `payment_method_id` varchar(191),
  `payment_method_options` json,
  `payment_method_types` json NOT NULL,
  `processing` json,
  `receipt_email` text,
  `review_id` varchar(191),
  `setup_future_usage` text,
  `shipping` json,
  `statement_descriptor` text,
  `statement_descriptor_suffix` text,
  `status` text NOT NULL,
  `transfer_data` json,
  `transfer_group` text
);

create table `stripe_payment_link` (
  `active` boolean NOT NULL,
  `allow_promotion_codes` boolean NOT NULL,
  `application_fee_amount` bigint,
  `application_fee_percent` decimal,
  `billing_address_collection` text NOT NULL,
  `consent_collection` json,
  `customer_creation` text NOT NULL,
  `id` varchar(191) primary key,
  `line_items` json,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `on_behalf_of_id` varchar(191),
  `payment_intent_data` json,
  `payment_method_types` json,
  `shipping_address_collection` json,
  `shipping_options` json NOT NULL,
  `submit_type` text NOT NULL,
  `subscription_data` json,
  `transfer_data` json,
  `url` text NOT NULL
);

create table `stripe_payout` (
  `amount` bigint NOT NULL,
  `arrival_date` bigint NOT NULL,
  `automatic` boolean NOT NULL,
  `balance_transaction_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text,
  `destination_id` varchar(191),
  `failure_balance_transaction_id` varchar(191),
  `failure_code` text,
  `failure_message` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `method` text NOT NULL,
  `object` text NOT NULL,
  `original_payout_id` varchar(191),
  `reversed_by_id` varchar(191),
  `source_type` text NOT NULL,
  `statement_descriptor` text,
  `status` text NOT NULL,
  `type` text NOT NULL
);

create table `stripe_plan` (
  `active` boolean NOT NULL,
  `aggregate_usage` text,
  `amount` bigint,
  `amount_decimal` text,
  `billing_scheme` text NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `id` varchar(191) primary key,
  `interval` text NOT NULL,
  `interval_count` bigint NOT NULL,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `nickname` text,
  `object` text NOT NULL,
  `product_id` varchar(191),
  `tiers` json,
  `tiers_mode` text,
  `transform_usage` json,
  `trial_period_days` bigint,
  `usage_type` text NOT NULL
);

create table `stripe_price` (
  `active` boolean NOT NULL,
  `billing_scheme` text NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `custom_unit_amount` json,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `lookup_key` text,
  `metadata` json NOT NULL,
  `nickname` text,
  `object` text NOT NULL,
  `product_id` varchar(191),
  `recurring` json,
  `tax_behavior` text,
  `tiers` json,
  `tiers_mode` text,
  `transform_quantity` json,
  `type` text NOT NULL,
  `unit_amount` bigint,
  `unit_amount_decimal` text
);

create table `stripe_product` (
  `active` boolean NOT NULL,
  `created` bigint NOT NULL,
  `default_price_id` varchar(191),
  `description` text,
  `id` varchar(191) primary key,
  `images` json NOT NULL,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `name` text NOT NULL,
  `object` text NOT NULL,
  `package_dimensions` json,
  `shippable` boolean,
  `statement_descriptor` text,
  `tax_code_id` varchar(191),
  `unit_label` text,
  `updated` bigint NOT NULL,
  `url` text
);

create table `stripe_promotion_code` (
  `active` boolean NOT NULL,
  `code` text NOT NULL,
  `created` bigint NOT NULL,
  `customer_id` varchar(191),
  `expires_at` bigint,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `max_redemptions` bigint,
  `metadata` json,
  `object` text NOT NULL,
  `times_redeemed` bigint NOT NULL
);

create table `stripe_quote` (
  `amount_subtotal` bigint NOT NULL,
  `amount_total` bigint NOT NULL,
  `application_id` varchar(191),
  `application_fee_amount` bigint,
  `application_fee_percent` decimal,
  `collection_method` text NOT NULL,
  `created` bigint NOT NULL,
  `currency` text,
  `customer_id` varchar(191),
  `default_tax_rates` json,
  `description` text,
  `discounts` json NOT NULL,
  `expires_at` bigint NOT NULL,
  `footer` text,
  `from_quote` json,
  `header` text,
  `id` varchar(191) primary key,
  `invoice_id` varchar(191),
  `invoice_settings` json,
  `line_items` json,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `number` text,
  `object` text NOT NULL,
  `on_behalf_of_id` varchar(191),
  `status` text NOT NULL,
  `subscription_id` varchar(191),
  `subscription_schedule_id` varchar(191),
  `transfer_data` json
);

create table `stripe_radar_early_fraud_warning` (
  `actionable` boolean NOT NULL,
  `charge_id` varchar(191),
  `created` bigint NOT NULL,
  `fraud_type` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `payment_intent_id` varchar(191)
);

create table `stripe_radar_value_list_item` (
  `created` bigint NOT NULL,
  `created_by` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `value` text NOT NULL,
  `value_list` text NOT NULL
);

create table `stripe_radar_value_list` (
  `alias` text NOT NULL,
  `created` bigint NOT NULL,
  `created_by` text NOT NULL,
  `id` varchar(191) primary key,
  `item_type` text NOT NULL,
  `list_items` json NOT NULL,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `name` text NOT NULL,
  `object` text NOT NULL
);

create table `stripe_reporting_report_run` (
  `created` bigint NOT NULL,
  `error` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `report_type` text NOT NULL,
  `result` json,
  `status` text NOT NULL,
  `succeeded_at` bigint
);

create table `stripe_reporting_report_type` (
  `data_available_end` bigint NOT NULL,
  `data_available_start` bigint NOT NULL,
  `default_columns` json,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `name` text NOT NULL,
  `object` text NOT NULL,
  `updated` bigint NOT NULL,
  `version` bigint NOT NULL
);

create table `stripe_review` (
  `billing_zip` text,
  `charge_id` varchar(191),
  `closed_reason` text,
  `created` bigint NOT NULL,
  `id` varchar(191) primary key,
  `ip_address` text,
  `ip_address_location` json,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `open` boolean NOT NULL,
  `opened_reason` text NOT NULL,
  `payment_intent_id` varchar(191),
  `reason` text NOT NULL,
  `session` json
);

create table `stripe_setup_intent` (
  `application_id` varchar(191),
  `attach_to_self` boolean,
  `cancellation_reason` text,
  `client_secret` text,
  `created` bigint NOT NULL,
  `customer_id` varchar(191),
  `description` text,
  `flow_directions` json,
  `id` varchar(191) primary key,
  `last_setup_error` json,
  `latest_attempt_id` varchar(191),
  `livemode` boolean NOT NULL,
  `mandate_id` varchar(191),
  `metadata` json,
  `next_action` json,
  `object` text NOT NULL,
  `on_behalf_of_id` varchar(191),
  `payment_method_id` varchar(191),
  `payment_method_options` json,
  `payment_method_types` json NOT NULL,
  `single_use_mandate_id` varchar(191),
  `status` text NOT NULL,
  `usage` text NOT NULL
);

create table `stripe_shipping_rate` (
  `active` boolean NOT NULL,
  `created` bigint NOT NULL,
  `delivery_estimate` json,
  `display_name` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `tax_behavior` text,
  `tax_code_id` varchar(191),
  `type` text NOT NULL
);

create table `stripe_scheduled_query_run` (
  `created` bigint NOT NULL,
  `data_load_time` bigint NOT NULL,
  `file` json,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `result_available_until` bigint NOT NULL,
  `sql` text NOT NULL,
  `status` text NOT NULL,
  `title` text NOT NULL
);

create table `stripe_source` (
  `amount` bigint,
  `client_secret` text NOT NULL,
  `created` bigint NOT NULL,
  `currency` text,
  `customer` text,
  `flow` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `owner` json,
  `statement_descriptor` text,
  `status` text NOT NULL,
  `type` text NOT NULL,
  `usage` text
);

create table `stripe_source_mandate_notification` (
  `amount` bigint,
  `created` bigint NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `reason` text NOT NULL,
  `status` text NOT NULL,
  `type` text NOT NULL
);

create table `stripe_source_transaction` (
  `amount` bigint NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `source` text NOT NULL,
  `status` text NOT NULL,
  `type` text NOT NULL
);

create table `stripe_subscription_item` (
  `billing_thresholds` json,
  `created` bigint NOT NULL,
  `id` varchar(191) primary key,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `quantity` bigint,
  `subscription` text NOT NULL,
  `tax_rates` json
);

create table `stripe_subscription_schedule` (
  `application_id` varchar(191),
  `canceled_at` bigint,
  `completed_at` bigint,
  `created` bigint NOT NULL,
  `current_phase` json,
  `customer_id` varchar(191),
  `end_behavior` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `phases` json NOT NULL,
  `released_at` bigint,
  `released_subscription` text,
  `status` text NOT NULL,
  `subscription_id` varchar(191)
);

create table `stripe_tax_code` (
  `description` text NOT NULL,
  `id` varchar(191) primary key,
  `name` text NOT NULL,
  `object` text NOT NULL
);

create table `stripe_tax_rate` (
  `active` boolean NOT NULL,
  `country` text,
  `created` bigint NOT NULL,
  `description` text,
  `display_name` text NOT NULL,
  `id` varchar(191) primary key,
  `inclusive` boolean NOT NULL,
  `jurisdiction` text,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `percentage` decimal NOT NULL,
  `state` text,
  `tax_type` text
);

create table `stripe_token` (
  `client_ip` text,
  `created` bigint NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `type` text NOT NULL,
  `used` boolean NOT NULL
);

create table `stripe_topup` (
  `amount` bigint NOT NULL,
  `balance_transaction_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text,
  `expected_availability_date` bigint,
  `failure_code` text,
  `failure_message` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `statement_descriptor` text,
  `status` text NOT NULL,
  `transfer_group` text
);

create table `stripe_transfer` (
  `amount` bigint NOT NULL,
  `amount_reversed` bigint NOT NULL,
  `balance_transaction_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text,
  `destination_id` varchar(191),
  `destination_payment_id` varchar(191),
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `reversals` json NOT NULL,
  `reversed` boolean NOT NULL,
  `source_transaction_id` varchar(191),
  `source_type` text,
  `transfer_group` text
);

create table `stripe_transfer_reversal` (
  `amount` bigint NOT NULL,
  `balance_transaction_id` varchar(191),
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `destination_payment_refund_id` varchar(191),
  `id` varchar(191) primary key,
  `metadata` json,
  `object` text NOT NULL,
  `source_refund_id` varchar(191),
  `transfer_id` varchar(191)
);

create table `stripe_treasury_credit_reversal` (
  `amount` bigint NOT NULL,
  `currency` text NOT NULL,
  `financial_account` text NOT NULL,
  `hosted_regulatory_receipt_url` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `network` text NOT NULL,
  `object` text NOT NULL,
  `received_credit` text NOT NULL,
  `status` text NOT NULL,
  `transaction_id` varchar(191)
);

create table `stripe_treasury_debit_reversal` (
  `amount` bigint NOT NULL,
  `currency` text NOT NULL,
  `financial_account` text,
  `hosted_regulatory_receipt_url` text,
  `id` varchar(191) primary key,
  `linked_flows` json,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `network` text NOT NULL,
  `object` text NOT NULL,
  `received_debit` text NOT NULL,
  `status` text NOT NULL,
  `transaction_id` varchar(191)
);

create table `stripe_treasury_financial_account` (
  `active_features` json NOT NULL,
  `country` text NOT NULL,
  `created` bigint NOT NULL,
  `financial_addresses` json NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json,
  `object` text NOT NULL,
  `pending_features` json NOT NULL,
  `platform_restrictions` json,
  `restricted_features` json NOT NULL,
  `status` text NOT NULL,
  `supported_currencies` json NOT NULL
);

create table `stripe_treasury_financial_account_features` (
  `object` text NOT NULL
);

create table `stripe_treasury_inbound_transfer` (
  `amount` bigint NOT NULL,
  `cancelable` boolean NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text,
  `failure_details` json,
  `financial_account` text NOT NULL,
  `hosted_regulatory_receipt_url` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `origin_payment_method` text NOT NULL,
  `origin_payment_method_details` json,
  `returned` boolean,
  `statement_descriptor` text NOT NULL,
  `status` text NOT NULL,
  `transaction_id` varchar(191)
);

create table `stripe_treasury_outbound_payment` (
  `amount` bigint NOT NULL,
  `cancelable` boolean NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `customer` text,
  `description` text,
  `destination_payment_method` text,
  `destination_payment_method_details` json,
  `end_user_details` json,
  `expected_arrival_date` bigint NOT NULL,
  `financial_account` text NOT NULL,
  `hosted_regulatory_receipt_url` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `returned_details` json,
  `statement_descriptor` text NOT NULL,
  `status` text NOT NULL,
  `transaction_id` varchar(191)
);

create table `stripe_treasury_outbound_transfer` (
  `amount` bigint NOT NULL,
  `cancelable` boolean NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text,
  `destination_payment_method` text NOT NULL,
  `expected_arrival_date` bigint NOT NULL,
  `financial_account` text NOT NULL,
  `hosted_regulatory_receipt_url` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `returned_details` json,
  `statement_descriptor` text NOT NULL,
  `status` text NOT NULL,
  `transaction_id` varchar(191)
);

create table `stripe_treasury_received_credit` (
  `amount` bigint NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text NOT NULL,
  `failure_code` text,
  `financial_account` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `network` text NOT NULL,
  `object` text NOT NULL,
  `status` text NOT NULL,
  `transaction_id` varchar(191)
);

create table `stripe_treasury_received_debit` (
  `amount` bigint NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text NOT NULL,
  `failure_code` text,
  `financial_account` text,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `network` text NOT NULL,
  `object` text NOT NULL,
  `status` text NOT NULL,
  `transaction_id` varchar(191)
);

create table `stripe_treasury_transaction_entry` (
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `effective_at` bigint NOT NULL,
  `financial_account` text NOT NULL,
  `flow` text,
  `flow_details` json,
  `flow_type` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `transaction_id` varchar(191),
  `type` text NOT NULL
);

create table `stripe_treasury_transaction` (
  `amount` bigint NOT NULL,
  `created` bigint NOT NULL,
  `currency` text NOT NULL,
  `description` text NOT NULL,
  `entries` json,
  `financial_account` text NOT NULL,
  `flow` text,
  `flow_details` json,
  `flow_type` text NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `object` text NOT NULL,
  `status` text NOT NULL
);

create table `stripe_webhook_endpoint` (
  `api_version` text,
  `application` text,
  `created` bigint NOT NULL,
  `description` text,
  `enabled_events` json NOT NULL,
  `id` varchar(191) primary key,
  `livemode` boolean NOT NULL,
  `metadata` json NOT NULL,
  `object` text NOT NULL,
  `secret` text,
  `status` text NOT NULL,
  `url` text NOT NULL
);

