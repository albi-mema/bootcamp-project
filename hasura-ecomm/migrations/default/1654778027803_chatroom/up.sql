CREATE TABLE "public"."chatroom" (
    "id_chatroom" text NOT NULL,
    "user_id" text NOT NULL,
    "chatname" text NOT NULL,
    "created_at" timestamptz DEFAULT now() NOT NULL,
    CONSTRAINT "chatroom_pkey" PRIMARY KEY ("id_chatroom")
) WITH (oids = false);

ALTER TABLE ONLY "public"."chatroom" 
ADD CONSTRAINT "chatroom_user_id_fkey" 
FOREIGN KEY (user_id) REFERENCES users(id) 
ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
