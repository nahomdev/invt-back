CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."price_lists"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "currency_id" uuid NOT NULL, "decimal_place" integer NOT NULL, "description" text NOT NULL, "is_default" boolean NOT NULL, "is_increase" boolean NOT NULL, "name" text NOT NULL, "percentage" integer NOT NULL, "pricebook_id" uuid NOT NULL, "pricebook_items" uuid NOT NULL, "pricebook_type" text NOT NULL, "rounding_type" text NOT NULL, "sales_or_purchase_type" text NOT NULL, "status" text NOT NULL, PRIMARY KEY ("id") );
