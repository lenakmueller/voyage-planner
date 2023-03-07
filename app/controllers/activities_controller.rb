class ActivitiesController < ApplicationController
  before_action :set_trip

  def new
    @activity = @trip.activities.new
  end

  def create
    @activity = @trip.activities.build(activity_params)

    if @activity.save
      redirect_to trip_path(@trip), notice: 'Activity was successfully added.'
    else
      render :new
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def activity_params
    params.require(:activity).permit(:name, :booking_ref, :date, :start_time, :end_time, :notes)
  end
end
