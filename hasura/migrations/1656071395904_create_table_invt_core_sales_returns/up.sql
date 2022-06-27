CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."sales_returns"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "salesreturn_number" text NOT NULL, "date" date NOT NULL, "reason" text NOT NULL, "line_items" uuid NOT NULL, "comments" uuid NOT NULL, "salesreturn_status" text NOT NULL, "salesorder_id" uuid NOT NULL, PRIMARY KEY ("id") );
