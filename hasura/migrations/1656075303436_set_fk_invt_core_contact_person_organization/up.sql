alter table "invt_core"."contact_person"
           add constraint "contact_person_organization_fkey"
           foreign key ("organization")
           references "invt_core"."organization"
           ("id") on update restrict on delete restrict;
