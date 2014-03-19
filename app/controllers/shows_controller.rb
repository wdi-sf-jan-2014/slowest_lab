class ShowsController < ApplicationController
  def show
    @show = Show.includes(:venue).find(params[:id])
    if signed_in?
      @attending_this = current_user.attendances.where(
        :show_id => @show.id).exists?
    end
  end
  def index
    @shows = Show.all
  end
end