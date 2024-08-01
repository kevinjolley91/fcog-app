Rails.application.routes.draw do
  get "/members" => "members#index"
  get "/members/:id" => "members#show"
  post "/members" => "members#create"
  patch "/members/:id" => "members#update"
end
