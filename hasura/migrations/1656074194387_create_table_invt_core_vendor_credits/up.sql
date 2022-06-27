CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."vendor_credits"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "vendor_credit_number" text NOT NULL, "date" date NOT NULL, "pricebook_id" uuid NOT NULL, "status" text NOT NULL, "reference_number" text NOT NULL, "vendor_id" uuid NOT NULL, "currency_id" uuid NOT NULL, "exchange_rate" float8 NOT NULL, "price_precision" integer NOT NULL, "line_items" uuid NOT NULL, "documents" uuid NOT NULL, "sub_total" float8 NOT NULL, "total" float8 NOT NULL, "total_credits_used" float8 NOT NULL, "total_refunded_amount" float8 NOT NULL, "balance" float8 NOT NULL, "notes" text NOT NULL, "comments" uuid NOT NULL, "vendor_credit_refunds" uuid NOT NULL, "bills_credited" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_invt_core_vendor_credits_updated_at"
BEFORE UPDATE ON "invt_core"."vendor_credits"
FOR EACH ROW
EXECUTE PROCEDURE "invt_core"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_invt_core_vendor_credits_updated_at" ON "invt_core"."vendor_credits" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
