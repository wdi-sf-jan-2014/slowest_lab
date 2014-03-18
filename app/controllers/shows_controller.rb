class ShowsController < ApplicationController
  def show
    @show = Show.find(params[:id])
  end
  def index
    @shows = Show.all
  end
end