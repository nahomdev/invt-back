alter table "invt_core"."item"
           add constraint "item_item_group_fkey"
           foreign key ("item_group")
           references "invt_core"."item_group"
           ("id") on update restrict on delete restrict;
