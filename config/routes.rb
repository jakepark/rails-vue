Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "trip#index"
  post "trip", to: "trip#create"
  post "login", to: "login#show"
  get "user", to: "user#index"
end
