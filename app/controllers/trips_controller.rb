class TripsController < ApplicationController
  before_action :set_trip, only: %i[edit update destroy show]

  def index
    @user = current_user
    friend_trips = Trip.joins(:friends).where("friends.user_id = ?", current_user.id)
    my_trips = Trip.where(user: current_user)
    trips = friend_trips + my_trips
    @trips = Trip.where(id: trips.pluck(:id)).order(:departure)

    if params[:query].present?
      @trips = @trips.search_by_title_and_location(params[:query])
      params.delete :query
    else
      @trips
    end

    @upcoming = @trips.select { |trip| trip.departure >= Date.today }
    @previous = @trips.select { |trip| trip.departure <= Date.today }
  end

  def show
    if params[:query].present?
      user = User.find_by(email: params[:query])
      Friend.create(user: user, trip: @trip)
      params.delete :query
    end

    @friends = @trip.friends

    @markers = [{
      lat: @trip.latitude,
      lng: @trip.longitude,
      info_window_html: render_to_string(partial: "info_marker", locals: { trip: @trip }),
      marker_html: render_to_string(partial: "marker")
    }]

    @accommodations = @trip.accommodations
    @activities = @trip.activities
    @transportations = @trip.transportations

    @components = [@accommodations, @transportations, @activities].flatten
    @components.sort_by! { |com| com.class.to_s == "Activity" ? com.date : com.departure }

    @accommodations.geocoded.map do |acc|
      el = {
        lat: acc.latitude,
        lng: acc.longitude,
        info_window_html: render_to_string(partial: "info_acc", locals: { acc: acc }),
        marker_html: render_to_string(partial: "acc_marker")
      }
      @markers.push(el)
    end

    @activities.geocoded.map do |act|
      el = {
        lat: act.latitude,
        lng: act.longitude,
        info_window_html: render_to_string(partial: "info_act", locals: { act: act }),
        marker_html: render_to_string(partial: "act_marker")
      }
      @markers.push(el)
    end

    @transportations.geocoded.map do |trans|
      el = {
        lat: trans.latitude,
        lng: trans.longitude,
        info_window_html: render_to_string(partial: "info_trans", locals: { trans: trans }),
        marker_html: render_to_string(partial: "trans_marker")
      }
      @markers.push(el)
    end

    # @components.sort_by { |com| com.class.to_s == "Activity" ? com.date : com.departure }

  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip), notice: 'Trip was successfully added.'
    else
      render :new, status: :unprocessable_entity
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
    params.require(:trip).permit(:title, :departure, :location, :return_day, :notes, :photo)
  end
end
