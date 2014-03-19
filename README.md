# The Slowest Lab

This app stores venues, shows, users, attendances of users to shows, and follows between users.  It's so slow!  Make it fast.  Write in the readme of your repo what changes you made and what effect they had.  Make migrations with your additional indexes, add eager loading, do joins, whatever is necessary.

To get started, create and migrate, then run `rake data:gen`.  This will take about 15 minutes, because it generates a lot of sample data, which we need because everything is fast with no data.

I suggest you start by optimizing the user page.  Go to /users/5, look at the logs created by that, and bring it down to below 100ms.  Right now the dashboard will take around 90 seconds, so save the dashboard for last.

starting point before any changes:
/users/5
3782ms

@user = User.includes(:attendances).find(params[:id])
/users/5
3452ms

Added user_id index to attendances
/users/5
3119ms

add_follower_index_to_follows
/users/5
1823ms

add_followed_index_to_follows
/users/5
682ms

User model: has_many :attendances, -> { includes(:show) }
Attendance model: belongs_to :show, -> { includes(:venue) }
/users/5
214ms

No further changes
dashboard
31703ms

Dashboard controller: @followed_attendances change
dashboard
1032ms