Rails.application.routes.draw do
  get 'sessions/new'

  resources :users

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  root "home#index"
end
