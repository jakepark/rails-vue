class LoginController < ApplicationController
  def show
    @params = params
    binding.pry
  end
end
