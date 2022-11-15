# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

DB Diagram code:

Table User {
  id int [pk, not null, unique]
  name string [not null]
  description text
  email string [not null, unique]
  password string [not null]
  photo blob
}

Table Theme {
  id int [pk, not null, unique]
  name string [not null, unique]
  description text
}

Table Community {
  id int [pk, not null, unique]
  name string [not null]
  description text
  theme_id int
}

Table Post {
  id int [pk, not null, unique]
  content text [not null]
  user_id int
  community_id int
}

Table Friendship {
  id int [pk, not null, unique]
  user_id int
  friend_id int
}

Ref: "Theme"."id" < "Community"."theme_id"

Ref: "Post"."user_id" > "User"."id"

Ref: "Community"."id" < "Post"."community_id"

Ref: "User"."id" < "Friendship"."friend_id"

Ref: "User"."id" < "Friendship"."user_id"
