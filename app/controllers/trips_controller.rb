class TripsController < ApplicationController
  def index
    if params[:query].present?
      @trips = current_user.Trip.search_by_title(params[:query])
    else
      @trips = current_user.trips.all
    end
  end

    # @trips = current_user.trips.all

  def new
    @trip = Trip.new
  end
end
