class TripController < ActionController::API

  def index
    puts ">>> TripController#index"
    trips = Trip.select('assignee_id', 'owner_id', 'ETA', 'ETC', 'status_id', 'action_id').all

    render json: trips.to_json
  end

  def create
    puts ">>> TripController#create"
    trip = Trip.new(trip_params)
    trip.status_id = 1 # magic number here
    
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
