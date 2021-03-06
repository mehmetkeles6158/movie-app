Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/actors" => "actors#index"
  get "/actors/:id" => "actors#show"
  post "/actors" => "actors#create"
  patch "/actors/:id" => "actors#update"
  delete "/actors/:id" => "actors#destroy"

  
  post "/sessions" => "sessions#create"

end
