class DashboardController < ApplicationController
  def show
    if !signed_in?
      redirect_to new_session_path
    else
      @attendances = current_user.attendances

      # This is the worst:
      # updated
      @followed_attendances = User.joins(followeds: [attendances: [{show: :venue}, :user]]).find(current_user.id)
    end
  end
end


# @followed_attendances = []
# current_user.followeds.page(params[:page]).map{|u| u.attendances}.each do |a|
#   @followed_attendances += a
# end
# @followed_attendances.sort_by!{|a| a.show.date}