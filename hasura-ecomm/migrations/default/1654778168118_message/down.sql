DROP TABLE IF EXISTS "message";

ALTER TABLE "message" DROP CONSTRAINT "message_chatroom_id_fkey" ;
ALTER TABLE "message" DROP CONSTRAINT "message_user_id_fkey" ;
