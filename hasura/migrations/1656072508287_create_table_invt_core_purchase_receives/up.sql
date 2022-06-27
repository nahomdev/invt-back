CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."purchase_receives"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "purchaseorder_number" text NOT NULL, "receive_id" uuid NOT NULL, "date" date NOT NULL, "vendor_id" uuid NOT NULL, "contact_persons" uuid NOT NULL, "notes" text NOT NULL, "line_items" uuid NOT NULL, "billing_address" uuid NOT NULL, "shipping_address" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_invt_core_purchase_receives_updated_at"
BEFORE UPDATE ON "invt_core"."purchase_receives"
FOR EACH ROW
EXECUTE PROCEDURE "invt_core"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_invt_core_purchase_receives_updated_at" ON "invt_core"."purchase_receives" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
