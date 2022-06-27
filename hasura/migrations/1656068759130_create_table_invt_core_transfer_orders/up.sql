CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."transfer_orders"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "transfer_order_number" text NOT NULL, "date" date NOT NULL, "from_warehouse_id" uuid NOT NULL, "to_warehouse_id" uuid NOT NULL, "line_items" uuid NOT NULL, "is_intransit_order" boolean NOT NULL, PRIMARY KEY ("id") );
