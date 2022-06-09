CREATE TABLE "public"."users" (
    "id" text NOT NULL,
    "username" text NOT NULL,
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);