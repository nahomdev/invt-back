CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."item_group"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "group_name" text NOT NULL, "brand" text NOT NULL, "manufacturer" text NOT NULL, "unit" text NOT NULL, "description" text NOT NULL, "tax_id" uuid NOT NULL, "attribute_name1" text NOT NULL, "items" uuid NOT NULL, PRIMARY KEY ("id") );
