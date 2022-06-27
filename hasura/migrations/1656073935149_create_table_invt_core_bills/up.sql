CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."bills"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "purchaseorder_id" uuid NOT NULL, "vendor_id" uuid NOT NULL, "unused_credits_payable_amount" float8 NOT NULL, "status" text NOT NULL, "bill_number" text NOT NULL, "date" date NOT NULL, "due_date" date NOT NULL, "reference_number" text NOT NULL, "due_by_days" integer NOT NULL, "currency_id" uuid NOT NULL, "price_precision" int4 NOT NULL, "exchange_rate" float8 NOT NULL, "is_item_level_tax_calc" boolean NOT NULL, "line_items" uuid NOT NULL, "taxes" uuid NOT NULL, "vendor_credits_applied" float8 NOT NULL, "sub_total" float8 NOT NULL, "tax_total" float8 NOT NULL, "balance" float8 NOT NULL, "billing_address" uuid NOT NULL, "payments" uuid NOT NULL, "vendor_credits" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "reference_id" uuid NOT NULL, "notes" text NOT NULL, "terms" text NOT NULL, "attachment_name" text NOT NULL, "open_purchaseorders_count" integer NOT NULL, PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_invt_core_bills_updated_at"
BEFORE UPDATE ON "invt_core"."bills"
FOR EACH ROW
EXECUTE PROCEDURE "invt_core"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_invt_core_bills_updated_at" ON "invt_core"."bills" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
