alter table "invt_core"."item_group"
           add constraint "item_group_tax_id_fkey"
           foreign key ("tax_id")
           references "invt_core"."taxes"
           ("id") on update restrict on delete restrict;
