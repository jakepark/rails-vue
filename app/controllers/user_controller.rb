class UserController < ActionController::API

  def index
    puts ">>> UserController#index"
    users = User.all

    render json: users.to_json
  end

  def create
    puts ">>> UserController#create"
    user = User.new(user_params)

    if user.save
      render json: user.to_json
    else
      head 500
    end
  end

  private
  def user_params
    params.require(:User).permit(:assignee_id, :owner_id, :ETA, :ETC,)
  end
end
