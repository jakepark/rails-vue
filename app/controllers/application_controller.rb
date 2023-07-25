class ApplicationController < ActionController::API
  @@current_user = "application"

  def index
    puts "ApplicationController#index"
    
  end

  def authenticate_user
    puts "authenticate_user"
    unless @@current_user != "application"
      redirect_to root_url
    end
  end

  def current_user
    puts "@@current_user: #{@@current_user}"
    @@current_user
  end

end
