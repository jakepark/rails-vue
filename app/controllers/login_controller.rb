class LoginController < ApplicationController
  def show
    @params = params

    login_user = User.find_by(email: safe_params[:email])

    if !!login_user
      set_current_user(login_user)
      render json: login_user.to_json
    else
      head(:unauthorized)
    end
  end

  private

  def set_current_user(user)
    @@current_user = user
  end

  def safe_params
    params.require(:login).permit(:email)
  end
end
