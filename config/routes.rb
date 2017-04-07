Rails.application.routes.draw do
  get "/foods" => "foods#index"
  get "/foods/new" => "foods#new"
  post "/foods" => "foods#create"
  get "/foods/:id" => "foods#show"
  get "/foods/:id/edit" => "foods#edit"
  patch "/foods/:id" => "foods#update"
  delete "/foods/:id" => "foods#destroy"

  
end
