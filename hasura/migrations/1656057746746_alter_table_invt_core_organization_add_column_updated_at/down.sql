DROP TRIGGER IF EXISTS "set_invt_core_organization_updated_at" ON "invt_core"."organization";
ALTER TABLE "invt_core"."organization" DROP COLUMN "updated_at";
