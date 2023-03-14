class ActivitiesController < ApplicationController
  before_action :set_trip

  def new
    @activity = @trip.activities.new
  end

  def create
    @activity = @trip.activities.build(activity_params)

    if @activity.valid?
      @activity.save
      redirect_to trip_path(@trip), notice: 'Success!'
    elsif @activity.errors[:base].include?("Please fill out at least one field")
      redirect_to new_trip_activity_path(@trip), alert: 'Please fill out at least one field'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to trip_path(@activity.trip)
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def activity_params
    params.require(:activity).permit(:name, :booking_ref, :date, :start_time, :end_time, :photo, :notes, :location)
  end
end
