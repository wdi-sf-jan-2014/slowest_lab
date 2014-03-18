class VenuesController < ApplicationController
  def show
    @venue = Venue.includes(:shows => :attendances).find(params[:id])
  end
  def index
    @venues = Venue.all
  end
end