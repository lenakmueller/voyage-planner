class TripsController < ApplicationController
  before_action :set_trip, only: %i[edit update]

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

  def create
    @trip = Trip.new(trip_params)
    # @trip.user = current_user

    if @trip.save
      redirect_to trip_path(@trip), notice: 'Trip was successfully added.'
    else
      render :new
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :departure, :location, :return_day, :notes, photos: [])
  end
end
