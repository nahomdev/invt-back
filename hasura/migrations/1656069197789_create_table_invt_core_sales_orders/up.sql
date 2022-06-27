CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."sales_orders"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "salesorder_number" text NOT NULL, "date" date NOT NULL, "status" text NOT NULL, "shipment_date" date NOT NULL, "reference_number" text NOT NULL, "customer_id" uuid NOT NULL, "currency_id" uuid NOT NULL, "exchange_rate" float8 NOT NULL, "discount_amount" float8 NOT NULL, "discount" float8 NOT NULL, "is_discount_before_tax" boolean NOT NULL, "discount_type" text NOT NULL, "delivery_method" text NOT NULL, "delivery_method_id" text NOT NULL, "line_items" text NOT NULL, "shipping_charge" float8 NOT NULL, "adjustment" float8 NOT NULL, "adjustment_description" text NOT NULL, "sub_total" float8 NOT NULL, "tax_total" float8 NOT NULL, "total" float8 NOT NULL, "taxes" uuid NOT NULL, "price_precision" integer NOT NULL, "pricebook_id" uuid NOT NULL, "shipping_address" uuid NOT NULL, "billing_address" uuid NOT NULL, "notes" text NOT NULL, "terms" text NOT NULL, "salesperson_id" uuid NOT NULL, "documents" uuid NOT NULL, PRIMARY KEY ("id") );
