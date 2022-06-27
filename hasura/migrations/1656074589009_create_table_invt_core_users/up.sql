CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "invt_core"."users"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "email" text NOT NULL, "user_role" text NOT NULL, PRIMARY KEY ("id") );
