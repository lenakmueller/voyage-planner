class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_trip, only: %i[edit update]

  def index
    @user = current_user
    if params[:query].present?
      @trips = Trip.where(user: current_user).search_by_title_and_location(params[:query])
    else
      @trips = Trip.where(user: current_user)
    end
  end

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
