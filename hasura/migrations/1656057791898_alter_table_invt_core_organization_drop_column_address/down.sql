ALTER TABLE "invt_core"."organization" ADD COLUMN "address" uuid;
ALTER TABLE "invt_core"."organization" ALTER COLUMN "address" DROP NOT NULL;
