CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."currency"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "currency_code" text NOT NULL, "currency_name" text NOT NULL, "currency_symbol" text NOT NULL, "price_precision" integer NOT NULL, "currency_format" text NOT NULL, "is_base_currency" boolean NOT NULL, PRIMARY KEY ("id") );
