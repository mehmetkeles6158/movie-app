Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/actor", controller: "actors", action:"firstactor"
  get "/allactors", controller: "actors", action:"all_actors"
  get "/query_single_actor" =>"actors#actor_method"
  get "/url_single_actor/:actor" =>"actors#actor_method"
  post "/body_single_actor" => "actors#actor_method"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"




end
