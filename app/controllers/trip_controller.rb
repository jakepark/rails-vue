class TripController < ActionController::API

  def index
    puts ">>> TripController#index"
    trips = Trip.all

    render json: trips.to_json
  end

end
