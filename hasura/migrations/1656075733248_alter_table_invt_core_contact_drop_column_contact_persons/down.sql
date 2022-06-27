ALTER TABLE "invt_core"."contact" ADD COLUMN "contact_persons" uuid;
ALTER TABLE "invt_core"."contact" ALTER COLUMN "contact_persons" DROP NOT NULL;
