table users{
  id serial [pk,increment]
  created_at timestamp
  updated_at timestamp
  username varchar(30)
  bio varchar(400)
  avatar varchar(200)
  phone varchar(25)
  email varchar(40)
  password varchar(50)
  status varchar(15)
}

table posts{
  id serial [pk,increment]
  created_at timestamp
  updated_at timestamp
  url varchar(200)
  caption varchar(240)
  lat real
  lng real
  user_id integer [ref: > users.id]
  
}

table comments{
  id serial [pk,increment]
  created_at timestamp
  updated_at timestamp
  contents varchar(240)
  user_id integer [ref: > users.id]
  post_id integer [ref: > posts.id]
}


table likes {
   id serial [pk, increment]
   created_at timestamp
   user_id integer [ref: > users.id]
   comment_id integer [ref: > comments.id]
  post_id integer [ref: > posts.id]
}

table photo_tags {
  id serial [pk,increment]
  created_at timestamp
  updated_at timestamp
  user_id integer [ref: > users.id]
  post_id integer [ref: > posts.id]
  x integer
  y integer
}



table caption_tags {
  id serial [pk,increment]
  created_at timestamp
  user_id integer [ref: > users.id]
  post_id integer [ref: > posts.id]
}


table hashtags {
  id serial [pk,increment]
  created_at timestamp
  title varchar(20) unique
}

table hashtags_posts {
  id serial [pk,increment]
  hashtag_id integer [ref: > hashtags.id]
  post_id integer [ref: > posts.id]
}


table followers {
  id serial [pk,increment]
  created_at timestamp
  leader_id integer [ref: > users.id]
  follower_id integer [ref: > users.id]
}