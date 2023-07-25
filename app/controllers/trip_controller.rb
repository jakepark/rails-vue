class TripController < ApplicationController
  before_action :authenticate_user

  def index
    puts "TripController#index"
    trips = Trip.all

    render json: trips.to_json
  end

  def create
    puts "TripController#create"
    trip = Trip.new(trip_params)

    if trip.save
      render json: trip.to_json
    else
      head 500
    end
  end

  private
  def trip_params
    params.require(:trip).permit(:assignee_id, :owner_id, :ETA, :ETC,)
  end
end
