Rails.application.routes.draw do
  get 'resultados/index'

  root "home#index"

  resources :cargos, only: [:index, :show]
  resources :candidatos, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :users, only: [:new, :create, :destroy]  #

 
  get  "/login",  to: "sessions#new",     as: :login
  post "/login",  to: "sessions#create"
  get  "/logout", to: "sessions#destroy", as: :logout

 
  get  "/votar", to: "votos#new",    as: :new_voto
  post "/votar", to: "votos#create", as: :voto

  get  "/resultados", to: "resultados#index", as: :resultados

  get "up" => "rails/health#show", as: :rails_health_check
end