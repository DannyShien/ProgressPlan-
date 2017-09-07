Rails.application.routes.draw do
  get 'auth/:provider/callback' => 'sessions#callback'

  get 'sessions/new'

  resources :users
  resources :posts

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  root "home#index"
end
