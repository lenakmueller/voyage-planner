class TripsController < ApplicationController
  before_action :set_trip, only: %i[edit update destroy show]

  def index
    @user = current_user
    if params[:query].present?
      @trips = Trip.where(user: current_user).search_by_title_and_location(params[:query])
    else
      @trips = Trip.where(user: current_user)
    end

    @upcoming = @trips.select { |trip| trip.departure >= Date.today }
    @previous = @trips.select { |trip| trip.departure <= Date.today }
  end

  def show
    @markers = [{
      lat: @trip.latitude,
      lng: @trip.longitude
    }]

    @accommodations = @trip.accommodations
    @activities = @trip.activities
    @transportations = @trip.transportations
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trip_path(@trip), notice: 'Trip was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip.destroy
    redirect_to trips_path, status: :see_other
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :departure, :location, :return_day, :notes, photos: [])
  end
end
