alter table "invt_core"."item_group"
           add constraint "item_group_items_fkey"
           foreign key ("items")
           references "invt_core"."item_group"
           ("id") on update restrict on delete restrict;
