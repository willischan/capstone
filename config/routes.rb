Rails.application.routes.draw do

  get "/" => "events#index"
  get "/events" => "events#index"

  get "/events/new" => "events#new"
  post "/events" => "events#create"

  get "/events/:id" => "events#show"

  get "/events/:id/edit" => "events#edit"
  patch "/events/:id" => "events#update"

  delete "/events/:id" => "events#destroy"
end
