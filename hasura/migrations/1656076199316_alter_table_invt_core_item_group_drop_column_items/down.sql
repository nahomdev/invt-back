ALTER TABLE "invt_core"."item_group" ADD COLUMN "items" uuid;
ALTER TABLE "invt_core"."item_group" ALTER COLUMN "items" DROP NOT NULL;
ALTER TABLE "invt_core"."item_group" ADD CONSTRAINT item_group_items_fkey FOREIGN KEY (items) REFERENCES "invt_core"."item_group" (id) ON DELETE restrict ON UPDATE restrict;
