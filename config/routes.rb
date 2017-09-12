Rails.application.routes.draw do
  resource :goals
  resource :daily_tasks

  get "complete/:id" => "goals#complete", as: 'complete'
  get 'auth/:provider/callback' => 'sessions#callback'


  resources :users
  resources :posts
  resources :tasks

  get "login" => "sessions#login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  root "home#index"
end
