class LoginController < ApplicationController
  def show
    @params = params
    
    current_user = User.find_by(email: safe_params[:email])
    puts "> LoginController #show current_user!: #{current_user.email} <"

  end

  private

  def safe_params
    params.require(:login).permit(:email)
  end
end
