alter table "invt_core"."contact_person"
           add constraint "contact_person_company_id_fkey"
           foreign key ("company_id")
           references "invt_core"."contact"
           ("id") on update restrict on delete restrict;
