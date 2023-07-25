class TripController < ActionController::API

  def index
    puts ">>> TripController#index"
    trips = Trip.all

    render json: trips.to_json
  end

  def create
    puts ">>> TripController#create"
    trip = Trip.new(trip_params)

    
    render json: trip.to_json
  end

  private
  def trip_params
    params.require(:trip).permit(:assignee_id, :ETA, :ETC)
  end
end
