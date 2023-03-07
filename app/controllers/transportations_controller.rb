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

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def transportation_params
    params.require(:transportation).permit(:departure, :return_day, :transport_mode, :location, :booking_ref, :notes)
  end
end
