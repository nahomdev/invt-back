CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."organization"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "currency_code" text NOT NULL, "fiscal_year_start_month" text, "time_zone" text NOT NULL, "date_format" text, "field_separator" text, "language_code" text DEFAULT 'en', "industry_type" text, "industry_size" text, "portal_name" text NOT NULL, "org_address" text NOT NULL, "address" uuid NOT NULL, PRIMARY KEY ("id") );
