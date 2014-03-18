# The Slowest Lab

This app stores venues, shows, users, attendances of users to shows, and follows between users.  It's so slow!  Make it fast.  Write in the readme of your repo what changes you made and what effect they had.  Make migrations with your additional indexes, add eager loading, do joins, whatever is necessary.

To get started, create and migrate, then run `rake data:gen`.  This will take about 15 minutes, because it generates a lot of sample data, which we need because everything is fast with no data.

I suggest you start by optimizing the user page.  Go to /users/5, look at the logs created by that, and bring it down to below 100ms.  Right now the dashboard will take around 90 seconds, so save the dashboard for last.


----------- Optimization Journal ------------


Page Loads

*** Sign In (User.first)
  -to load first page (sign in page), less than 10ms

*** My Dashboard
(initial)
Rendered attendances/_attendance_with_user.html.erb (26208.1ms)
Rendered dashboard/show.html.erb within layouts/application (27093.5ms)
Completed 200 OK in 73815ms (Views: 25039.7ms | ActiveRecord: 41489.3ms)

*** Users (index)
yikes. stay away from this page. takes 20+ minutes to load (I abandoned).

*** Show User (user/5)
(initial)
q1 User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT 1...
q2 User Load (0.7ms)  SELECT "users".* FROM "users" WHERE "users"."remember_token"...

Follow Exists 
q3 SELECT 1 AS one FROM "follows" WHERE "follows"."follower_id" = $1 AND...
(656.3ms)

q4 SELECT COUNT(*) FROM "users" INNER JOIN "follows" ON "users"."id" = "follows"."followed_id"...
(672.3ms)

q5 SELECT COUNT(*) FROM "users" INNER JOIN "follows" ON "users"."id" = "follows"."follower_id"...
(627.8ms)

Attendance Load
q6 SELECT "attendances".* FROM "attendances" WHERE "attendances"."user_id" =...
(315.5ms)

(ms)              q1    q2    q3      q4      q5      q6
    initial       0.5   0.7   656.3   672.3   627.8   315.5
add remember idx  0.5   0.9   677.3   658.9   643.3   313.3
add follow fk idx 0.6   0.6     1.2     4.4     3.3   320.5


Rendered attendances/_attendance.html.erb (202.7ms)
Rendered users/show.html.erb within layouts/application (2076.7ms)
Completed 200 OK in 2753ms (Views: 419.0ms | ActiveRecord: 2325.7ms)

*** Venues


*** Shows