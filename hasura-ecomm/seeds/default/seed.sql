INSERT INTO "public"."users" ("id", "username")

SELECT

CONCAT('u', "u") AS "id",
CONCAT('User', "u") AS "username"

FROM generate_series(1, 10) AS "u"

ON CONFLICT ON CONSTRAINT "users_pkey"
DO UPDATE SET
"username" = EXCLUDED."username";



INSERT INTO "public"."chatroom" ("id_chatroom","user_id","chatname")

SELECT
CONCAT('c', "c") AS "id_chatroom",
CONCAT('u', floor(random() * (10 - 1 + 1) + 1)) AS "user_id",
CONCAT('chatname',"c")AS "chatname"

FROM generate_series(1, 10) AS "c"

ON CONFLICT ON CONSTRAINT "chatroom_pkey"
DO UPDATE SET
"user_id" = EXCLUDED."user_id",
"chatname"= EXCLUDED."chatname";



INSERT INTO "public"."message" ("id_msg", "user_id", "chatroom_id", "message","created_at")

SELECT
CONCAT('m', "m") AS "id_msg",
CONCAT('u', floor(random() * (10 - 1 + 1) + 1)) AS "user_id",
CONCAT('c', floor(random() * (10 - 1 + 1) + 1)) AS "chatroom_id",
CONCAT('Message', "m") AS "message",
CURRENT_TIMESTAMP AS "created_at"

FROM generate_series(1, 100) AS "m"

ON CONFLICT ON CONSTRAINT "message_pkey"
DO UPDATE SET
"user_id" = EXCLUDED."user_id",
"chatroom_id" = EXCLUDED."chatroom_id",
"message" = EXCLUDED."message",
"created_at" = EXCLUDED."created_at"









