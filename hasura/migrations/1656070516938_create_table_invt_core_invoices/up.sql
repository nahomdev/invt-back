CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."invoices"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "ach_payment_initiated" boolean NOT NULL, "invoice_number" text NOT NULL, "date" date NOT NULL, "status" text NOT NULL, "payment_terms" integer NOT NULL, "payment_terms_label" text NOT NULL, "due_date" date NOT NULL, "payment_expected_date" date NOT NULL, "last_payment_date" date NOT NULL, "reference_number" text NOT NULL, "customer_id" uuid NOT NULL, "currency_id" text NOT NULL, "exchange_rate" float8 NOT NULL, "discount" float8 NOT NULL, "is_discount_before_tax" boolean NOT NULL, "discount_type" text NOT NULL, "is_inclusive_tax" boolean NOT NULL, "recurring_invoice_id" uuid NOT NULL, "is_viewed_by_client" boolean NOT NULL, "has_attachment" boolean NOT NULL, "client_viewed_time" text NOT NULL, "line_items" uuid NOT NULL, "shipping_charge" float8 NOT NULL, "adjustment" float8 NOT NULL, "adjustment_description" text NOT NULL, "sub_total" float8 NOT NULL, "tax_total" float8 NOT NULL, "total" text NOT NULL, "taxes" uuid NOT NULL, "payment_reminder_enabled" boolean NOT NULL, "payment_made" float8 NOT NULL, "credits_applied" float8 NOT NULL, "tax_amount_withheld" float8 NOT NULL, "balance" text NOT NULL, "write_off_amount" float8 NOT NULL, "allow_partial_payments" boolean NOT NULL, "price_precision" integer NOT NULL, "payment_options" uuid NOT NULL, "is_emailed" boolean NOT NULL, "reminders_sent" integer NOT NULL, "last_reminder_sent_date" text NOT NULL, "billing_address" uuid NOT NULL, "shipping_address" uuid NOT NULL, "notes" text NOT NULL, "terms" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "attachment_name" text NOT NULL, "can_send_in_mail" boolean NOT NULL, "salesperson_id" uuid NOT NULL, "invoice_url" text NOT NULL, PRIMARY KEY ("id") );
CREATE OR REPLACE FUNCTION "invt_core"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_invt_core_invoices_updated_at"
BEFORE UPDATE ON "invt_core"."invoices"
FOR EACH ROW
EXECUTE PROCEDURE "invt_core"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_invt_core_invoices_updated_at" ON "invt_core"."invoices" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
