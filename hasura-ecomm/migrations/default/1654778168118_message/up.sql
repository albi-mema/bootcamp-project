CREATE TABLE "public"."message" (
    "id_msg" text NOT NULL,
    "user_id" text NOT NULL,
    "chatroom_id" text NOT NULL,
    "message" text NOT NULL,
    "created_at" timestamptz DEFAULT now() NOT NULL,
    CONSTRAINT "message_pkey" PRIMARY KEY ("id_msg")
) WITH (oids = false);

ALTER TABLE ONLY "public"."message" ADD CONSTRAINT "message_chatroom_id_fkey" FOREIGN KEY (chatroom_id) REFERENCES chatroom(id_chatroom) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."message" ADD CONSTRAINT "message_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;