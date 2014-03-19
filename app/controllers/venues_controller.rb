class VenuesController < ApplicationController
  def show
    @venue = Venue.includes(:shows).find(params[:id])
  end
  def index
    @venues = Venue.all
  end
end
