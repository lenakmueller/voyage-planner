class TripsController < ApplicationController
  before_action :set_trip, only: %i[edit update destroy show]

  def index
    @user = current_user
    if params[:query].present?
      @trips = Trip.where(user: current_user).search_by_title_and_location(params[:query]).order('departure ASC')
    else
      @trips = Trip.where(user: current_user).order('departure ASC')
    end

    @upcoming = @trips.select { |trip| trip.departure >= Date.today }
    @previous = @trips.select { |trip| trip.departure <= Date.today }
  end

  def show
    # @users = User.all
    if params[:query].present?
      @friend = User.where(email: params[:query]).as_json()
    end

    @markers = [{
      lat: @trip.latitude,
      lng: @trip.longitude,
      info_window_html: render_to_string(partial: "info_marker", locals: { trip: @trip }),
      marker_html: render_to_string(partial: "marker")
    }]

    @accommodations = @trip.accommodations
    @accommodations.geocoded.map do |acc|
      el = {
        lat: acc.latitude,
        lng: acc.longitude,
        info_window_html: render_to_string(partial: "info_acc", locals: { acc: acc }),
        marker_html: render_to_string(partial: "acc_marker")
      }
      @markers.push(el)
    end

    @activities = @trip.activities
    @activities.geocoded.map do |act|
      el = {
        lat: act.latitude,
        lng: act.longitude,
        info_window_html: render_to_string(partial: "info_act", locals: { act: act }),
        marker_html: render_to_string(partial: "act_marker")
      }
      @markers.push(el)
    end

    @transportations = @trip.transportations
    @transportations.geocoded.map do |trans|
      el = {
        lat: trans.latitude,
        lng: trans.longitude,
        info_window_html: render_to_string(partial: "info_trans", locals: { trans: trans }),
        marker_html: render_to_string(partial: "trans_marker")
      }
      @markers.push(el)
    end
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
