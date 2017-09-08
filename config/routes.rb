Rails.application.routes.draw do
  resource :goals

  # get "posts/index"

  get "complete/:id" => "goals#complete", as: 'complete'
  get 'auth/:provider/callback' => 'sessions#callback'


  resources :users
  resources :posts

  get "login" => "sessions#login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  root "home#index"
end
