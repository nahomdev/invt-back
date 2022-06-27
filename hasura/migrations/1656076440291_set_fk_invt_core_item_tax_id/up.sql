alter table "invt_core"."item"
           add constraint "item_tax_id_fkey"
           foreign key ("tax_id")
           references "invt_core"."taxes"
           ("id") on update restrict on delete restrict;
