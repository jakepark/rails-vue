class LoginController < ApplicationController
  def show
    @params = params

    current_user = User.find_by(email: safe_params[:email])

    if !!current_user
      render json: current_user.to_json
    else
      head(:unauthorized)
    end
  end

  private

  def safe_params
    params.require(:login).permit(:email)
  end
end
