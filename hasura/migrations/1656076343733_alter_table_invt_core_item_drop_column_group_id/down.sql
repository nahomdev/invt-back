ALTER TABLE "invt_core"."item" ADD COLUMN "group_id" uuid;
ALTER TABLE "invt_core"."item" ALTER COLUMN "group_id" DROP NOT NULL;
