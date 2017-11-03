Rails.application.routes.draw do

  root to: "events#index"

  resources :events
  resources :users
  resources :restaurants
  resources :messages

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/user_events/:id" => "user_events#create"
  post "/user_events" => "user_events#create"


end
