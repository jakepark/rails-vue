class ApplicationController < ActionController::API

  def index
    puts ">>> ApplicationController#index"
    
  end

  def current_user
    puts "current_user"
  end
end
