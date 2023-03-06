class TripsController < ApplicationController
  def index
    @trips = current_user.trips.all
  end

  def new
    @trip = Trip.new
  end
end
