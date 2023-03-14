class TransportationsController < ApplicationController
  before_action :set_trip

  def new
    @transportation = @trip.transportations.build
  end

  def create
    @transportation = @trip.transportations.build(transportation_params)

    if @transportation.save
      redirect_to @trip, notice: 'You have added this transportation successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @transportation = Transportation.find(params[:id])
  end

  def update
    @transportation = Transportation.find(params[:id])
    @transportation.update(transportation_params)
    if params["transport_mode"].nil?
      @transportation.transport_mode = @transportation.transport_mode
    end
    redirect_to trip_path(@transportation.trip)
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def transportation_params
    params.require(:transportation).permit(:departure, :return_day, :transport_mode, :location, :booking_ref, :photo, :notes)
  end
end
