class DashboardController < ApplicationController
  def show
    if !signed_in?
      redirect_to new_session_path
    else
      @attendances = current_user.attendances.includes(:show => :venue)

      @followed_attendances = Attendance.includes(
        :user, :show => :venue
        ).joins(:user => :inward_follows
        ).where(:follows => {:follower_id => current_user.id}
        ).order('shows.date asc').limit(300)
    end
  end
end