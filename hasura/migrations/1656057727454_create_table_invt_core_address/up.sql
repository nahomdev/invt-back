CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."address"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "street_address1" text, "street_address2" text, "city" text NOT NULL, "state" text, "country" text NOT NULL DEFAULT 'Ethiopia', "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_invt_core_address_updated_at"
BEFORE UPDATE ON "invt_core"."address"
FOR EACH ROW
EXECUTE PROCEDURE "invt_core"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_invt_core_address_updated_at" ON "invt_core"."address" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
