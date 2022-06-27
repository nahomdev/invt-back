alter table "invt_core"."contact"
           add constraint "contact_currency_id_fkey"
           foreign key ("currency_id")
           references "invt_core"."currency"
           ("id") on update restrict on delete restrict;
