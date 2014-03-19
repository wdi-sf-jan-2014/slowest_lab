class ShowsController < ApplicationController
  def show
    @show = Show.includes(:users, :venue).find(params[:id])
    if signed_in?
      @attending_this = current_user.attendances.where(
        :show_id => @show.id).exists?
    end
  end
  def index
    @shows = Show.includes(:users).limit(100)
  end
end