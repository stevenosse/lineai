alter table "public"."conversations" add column "temperature" double precision not null default '1'::double precision;

alter table "public"."messages" add column "user_id" text;

alter table "public"."messages" add constraint "messages_conversation_id_fkey" FOREIGN KEY (conversation_id) REFERENCES conversations(id) not valid;

alter table "public"."messages" validate constraint "messages_conversation_id_fkey";


