alter table "public"."messages" add column "answered_message_id" bigint;

alter table "public"."messages" add constraint "messages_answered_message_id_fkey" FOREIGN KEY (answered_message_id) REFERENCES messages(id) not valid;

alter table "public"."messages" validate constraint "messages_answered_message_id_fkey";


