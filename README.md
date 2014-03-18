# The Slowest Lab

This app stores venues, shows, users, attendances of users to shows, and follows between users.  It's so slow!  Make it fast.  Write in the readme of your repo what changes you made and what effect they had.

To get started, create and migrate, then run `rake data:gen`.  This will take about 2 minutes, because it generates a lot of sample data, which we need because everything is fast with no data.

What I did:
1) Made the users show page render faster:
  - Added ```has_many :shows, :through => :attendances``` in the users model
  - Added @user = `User.includes(:shows, :venues).find(params[:id])` in the users controller
2) Made the venues show page render faster:
  - Added ```has_many :venues, :through=> :shows``` in the users model
  - Added ```@venue = Venue.includes(:shows => (:attendances)).find(params[:id])``` in the venues controller
  - Added ```has_many :attendances, :through => :shows``` in the venue model