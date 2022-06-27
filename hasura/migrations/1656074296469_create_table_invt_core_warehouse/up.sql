CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."warehouse"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "warehouse_name" text NOT NULL, "address" uuid NOT NULL, "phone" text NOT NULL, "email" text NOT NULL, PRIMARY KEY ("id") );
