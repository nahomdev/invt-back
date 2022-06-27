CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."taxes"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "tax_name" text NOT NULL, "tax_percentage" float8 NOT NULL, "tax_type" text NOT NULL, "is_value_added" boolean NOT NULL, PRIMARY KEY ("id") );
