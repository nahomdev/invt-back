CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."credit_notes"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "creditnote_number" text NOT NULL, "date" Date NOT NULL, "vat_reg_no" text NOT NULL, "status" text NOT NULL, "customer_id" uuid NOT NULL, "reference_number" text NOT NULL, "email" text NOT NULL, "total" float8 NOT NULL, "balance" float8 NOT NULL, "line_items" uuid NOT NULL, "invoices" uuid NOT NULL, "taxes" uuid NOT NULL, "currency_id" uuid NOT NULL, "billing_address" uuid NOT NULL, "shipping_address" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "notes" text NOT NULL, "terms" text NOT NULL, PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_invt_core_credit_notes_updated_at"
BEFORE UPDATE ON "invt_core"."credit_notes"
FOR EACH ROW
EXECUTE PROCEDURE "invt_core"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_invt_core_credit_notes_updated_at" ON "invt_core"."credit_notes" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
