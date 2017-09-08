Rails.application.routes.draw do
  get 'posts/index'

  get 'auth/:provider/callback' => 'sessions#callback'

  

  resources :users
  resources :posts

  get "login" => "sessions#login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  root "home#index"
end
