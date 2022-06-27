CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."purchase_orders"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "documents" uuid NOT NULL, "purchaseorder_number" text NOT NULL, "date" date NOT NULL, "expected_delivery_date" date NOT NULL, "date_formatted" text NOT NULL, "expected_delivery_date_formatted" date NOT NULL, "delivery_date_formatted" date NOT NULL, "status_formatted" text NOT NULL, "billed_status" integer NOT NULL, "is_emailed" boolean NOT NULL, "is_inclusive_tax" boolean NOT NULL, "is_backorder" boolean NOT NULL, "reference_number" text NOT NULL, "status" text NOT NULL, "vendor_id" uuid NOT NULL, "comments" uuid NOT NULL, "currency_id" uuid NOT NULL, "exchange_rate" float8 NOT NULL, "delivery_date" date NOT NULL, "salesorder_id" uuid NOT NULL, "is_drop_shipment" boolean NOT NULL, "line_items" uuid NOT NULL, "sub_total" float8 NOT NULL, "sub_total_formatted" text NOT NULL, "tax_total" float8 NOT NULL, "total" float8 NOT NULL, "taxes" uuid NOT NULL, "price_precision" integer NOT NULL, "pricebook_id" uuid NOT NULL, "billing_address" uuid NOT NULL, "notes" text NOT NULL, "terms" text NOT NULL, "ship_via" text NOT NULL, "ship_via_id" uuid NOT NULL, "attention" text NOT NULL, "delivery_org_address_id" uuid NOT NULL, "delivery_customer_id" uuid NOT NULL, "delivery_address" uuid NOT NULL, "attachment_id" uuid NOT NULL, "can_send_in_mail" boolean NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "purchasereceives" uuid NOT NULL, "bills" uuid NOT NULL, PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_invt_core_purchase_orders_updated_at"
BEFORE UPDATE ON "invt_core"."purchase_orders"
FOR EACH ROW
EXECUTE PROCEDURE "invt_core"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_invt_core_purchase_orders_updated_at" ON "invt_core"."purchase_orders" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
