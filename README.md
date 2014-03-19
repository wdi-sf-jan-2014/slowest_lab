# The Slowest Lab

This app stores venues, shows, users, attendances of users to shows, and follows between users.  It's so slow!  Make it fast.  Write in the readme of your repo what changes you made and what effect they had.  Make migrations with your additional indexes, add eager loading, do joins, whatever is necessary.

To get started, create and migrate, then run `rake data:gen`.  This will take about 15 minutes, because it generates a lot of sample data, which we need because everything is fast with no data.

I suggest you start by optimizing the user page.  Go to /users/5, look at the logs created by that, and bring it down to below 100ms.  Right now the dashboard will take around 90 seconds, so save the dashboard for last.

You'll need to paginate some excessive queries also.  I suggest using kaminari.
>>>>>>> fd328a948f0e6f3363f15c84126b789b838143f1


# The Fastest Lab

#### Venue Show
                (from views) | (from AR) | Total

initial         269.5ms       1636.0ms    1930ms
eager_loading   139.2ms       1503.6ms    1645ms

#### User Show
                _attendance | show    | (from views) | (from AR) | Total

initial         163.9ms      1652.6ms    134.8ms       2142.3ms    2280ms
eager loading   31.2ms       1259.6ms    47.1ms        1522.7ms    1669ms
add_idx:follows 30.5ms       218.6ms     47.0ms        482.4ms     593ms
add_2dx:follows 29.6ms       46.1m       45.7ms        338.7ms     445ms
add_idx:attends 30.4ms       44.2ms      45.6ms        30.4ms      133ms
fixed migrtions 29.2ms       36.7ms      37.2ms        16.0ms      70ms


#### Dashboard Show
                _attendance | application | (from views) | (from AR) | Total

initial         290.9ms      292.5ms       256.6ms        81.7ms       409ms
