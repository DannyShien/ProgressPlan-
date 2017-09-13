Rails.application.routes.draw do
  get "complete/:id" => "goals#complete", as: 'complete'
  get 'auth/:provider/callback' => 'sessions#callback'
  
  post "toggle_like" => "likes#toggle"
  
  resource :goals
  resource :daily_tasks
  resources :users
  resources :posts
  resources :tasks do
    patch :complete, on: :member
  end

  get "login" => "sessions#login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  root "home#index"
end
