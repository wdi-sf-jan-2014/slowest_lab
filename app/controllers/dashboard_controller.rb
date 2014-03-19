class DashboardController < ApplicationController
  def show
    if !signed_in?
      redirect_to new_session_path
    else
      @attendances = current_user.attendances.distinct

      #This is the worst:
    @followed_attendances = []
    current_user.followeds.map{|u| u.attendances}.each do |a|
      @followed_attendances += a
    end
    @followed_attendances.sort_by!{|a| a.show.date}
      
    #  @followed_attendances = User.includes(followeds: [attendances: [{show: :venue}, :user]]).find(current_user.id)

  #    @followed_attendances = current_user.followeds.includes(:attendances)

    end
  end
end