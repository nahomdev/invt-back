alter table "invt_core"."contact"
           add constraint "contact_billing_address_fkey"
           foreign key ("billing_address")
           references "invt_core"."address"
           ("id") on update restrict on delete restrict;
