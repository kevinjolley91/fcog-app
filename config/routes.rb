Rails.application.routes.draw do
  get "/members" => "members#index"
  post "/members" => "members#create"
end
