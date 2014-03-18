class DashboardController < ApplicationController
  def show
    if !user_signed_in?
      redirect_to new_session_path
    else
      @attendances = current_user.attendances
      @followed_attendances = current_user.followeds.map{|u| u.attendances}.sort_by{|a| a.show.date}
    end
end