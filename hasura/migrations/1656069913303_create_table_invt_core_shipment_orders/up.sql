CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."shipment_orders"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "salesorder_id" uuid NOT NULL, "shipment_number" text NOT NULL, "date" date NOT NULL, "status" text NOT NULL, "detailed_status" boolean NOT NULL, "status_message" text NOT NULL, "carrier" text NOT NULL, "service" text NOT NULL, "delivery_days" text NOT NULL, "delivery_guarantee" boolean NOT NULL, "reference_number" text NOT NULL, "customer_id" uuid NOT NULL, "currency_id" uuid NOT NULL, "exchange_rate" float8 NOT NULL, "discount_amount" float8 NOT NULL, "discount" float8 NOT NULL, "is_discount_before_tax" boolean NOT NULL, "discount_type" text NOT NULL, "estimate_id" uuid NOT NULL, "delivery_method" text NOT NULL, "delivery_method_id" uuid NOT NULL, "tracking_number" text NOT NULL, "shipping_charge" float8 NOT NULL, "sub_total" float8 NOT NULL, "tax_total" float8 NOT NULL, "total" float8 NOT NULL, "taxes" uuid NOT NULL, "price_precision" integer NOT NULL, "is_emailed" boolean NOT NULL, "billing_address" uuid NOT NULL, "shipping_address" uuid NOT NULL, "notes" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_invt_core_shipment_orders_updated_at"
BEFORE UPDATE ON "invt_core"."shipment_orders"
FOR EACH ROW
EXECUTE PROCEDURE "invt_core"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_invt_core_shipment_orders_updated_at" ON "invt_core"."shipment_orders" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
