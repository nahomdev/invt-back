alter table "invt_core"."contact"
           add constraint "contact_shipping_address_fkey"
           foreign key ("shipping_address")
           references "invt_core"."address"
           ("id") on update restrict on delete restrict;
