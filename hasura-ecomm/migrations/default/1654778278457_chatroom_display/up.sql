CREATE VIEW "chatroom_display" AS SELECT agg_chatroom.id_chatroom,
    agg_chatroom.chatname,
    agg_chatroom.count,
    last_messages.message,
    last_messages.created_at,
    last_messages.user_name
   FROM ( SELECT c.id_chatroom,
            c.chatname,
            count(m.*) AS count
           FROM (message m
             LEFT JOIN chatroom c ON ((c.id_chatroom = m.chatroom_id)))
          GROUP BY c.id_chatroom, c.chatname) agg_chatroom,
    LATERAL ( SELECT m.message,
            m.created_at,
            users.username AS user_name
           FROM (message m
             LEFT JOIN users ON ((users.id = m.user_id)))
          WHERE (m.chatroom_id = agg_chatroom.id_chatroom)
          ORDER BY m.created_at DESC
         LIMIT 1) last_messages;