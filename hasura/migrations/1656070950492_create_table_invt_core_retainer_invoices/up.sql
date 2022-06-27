CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."retainer_invoices"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "retainerinvoice_number" text NOT NULL, "date" date NOT NULL, "status" text NOT NULL, "is_pre_gst" text NOT NULL, "project_id" text NOT NULL, "project_name" uuid NOT NULL, "last_payment_date" date NOT NULL, "reference_number" text NOT NULL, "customer_id" uuid NOT NULL, "currency_id" uuid NOT NULL, "exchange_rate" float8 NOT NULL, "is_viewed_by_client" boolean NOT NULL, "client_viewed_time" boolean NOT NULL, "is_inclusive_tax" boolean NOT NULL, "line_items" uuid NOT NULL, "sub_total" float8 NOT NULL, "total" float8 NOT NULL, "taxes" uuid NOT NULL, "payment_made" float8 NOT NULL, "payment_drawn" float8 NOT NULL, "balance" text NOT NULL, "allow_partial_payments" boolean NOT NULL, "price_precision" integer NOT NULL, "payment_options" Boolean NOT NULL, "is_emailed" boolean NOT NULL, "documents" uuid NOT NULL, "billing_address" uuid NOT NULL, "shipping_address" uuid NOT NULL, "notes" text NOT NULL, "terms" text NOT NULL, "attachment_name" text NOT NULL, "can_send_in_mail" boolean NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_invt_core_retainer_invoices_updated_at"
BEFORE UPDATE ON "invt_core"."retainer_invoices"
FOR EACH ROW
EXECUTE PROCEDURE "invt_core"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_invt_core_retainer_invoices_updated_at" ON "invt_core"."retainer_invoices" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
