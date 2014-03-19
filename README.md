# The Slowest Lab

This app stores venues, shows, users, attendances of users to shows, and follows between users.  It's so slow!  Make it fast.  Write in the readme of your repo what changes you made and what effect they had.  Make migrations with your additional indexes, add eager loading, do joins, whatever is necessary.

To get started, create and migrate, then run `rake data:gen`.  This will take about 15 minutes, because it generates a lot of sample data, which we need because everything is fast with no data.

I suggest you start by optimizing the user page.  Go to /users/5, look at the logs created by that, and bring it down to below 100ms.  Right now the dashboard will take around 90 seconds, so save the dashboard for last.


http://localhost:3000/users/5
- intitial test:
* Completed 200 OK in 4440ms (Views: 2718.9ms | ActiveRecord: 1685.0ms)

- updated user show with: @user = User.includes(attendances: [{show: :venue}]).find(params[:id])
* Completed 200 OK in 1558ms (Views: 48.6ms | ActiveRecord: 1405.6ms)

- added index association of show_id and user_id in attendances
* Completed 200 OK in 1144ms (Views: 33.1ms | ActiveRecord: 1091.8ms)

- added index association of venue_id in shows model
* Completed 200 OK in 1346ms (Views: 49.5ms | ActiveRecord: 1189.8ms)

- added index association of followed_id and follower_id in Follows
* Completed 200 OK in 239ms (Views: 73.2ms | ActiveRecord: 43.4ms)


http://localhost:3000/shows/5
- intiial test:
* Completed 200 OK in 98ms (Views: 53.4ms | ActiveRecord: 21.6ms)

- updates shows show with: @show = Show.includes(:venue).find(params[:id])
* Completed 200 OK in 90ms (Views: 38.1ms | ActiveRecord: 20.9ms)

http://localhost:3000/
* Completed 200 OK in 26358ms (Views: 18346.0ms | ActiveRecord: 3049.1ms)
* Completed 200 OK in 26284ms (Views: 18087.2ms | ActiveRecord: 3240.9ms)

