class AccommodationsController < ApplicationController
  before_action :set_trip

  def new
    @accommodation = @trip.accommodations.new
  end

  def create
    @accommodation = @trip.accommodations.build(accommodation_params)

    if @accommodation.valid?
      @accommodation.save
      redirect_to trip_path(@trip), notice: 'Success!'
    elsif @accommodation.errors[:base].include?("Please fill out at least one field")
      redirect_to new_trip_accommodation_path(@trip), alert: 'Please fill out at least one field'
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end


  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def accommodation_params
    params.require(:accommodation).permit(:departure, :booking_ref, :location, :notes, :return_day, :photo, :accommodation_mode)
  end
end
