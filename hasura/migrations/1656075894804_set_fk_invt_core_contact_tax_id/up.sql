alter table "invt_core"."contact"
           add constraint "contact_tax_id_fkey"
           foreign key ("tax_id")
           references "invt_core"."taxes"
           ("id") on update restrict on delete restrict;
