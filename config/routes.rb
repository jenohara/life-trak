Rails.application.routes.draw do

  devise_for :users
  root 'welcome#home'
  get 'welcome/home' => 'welcome#home'

  get '/auth/google/callback' => 'sessions#create'
  
  get '/signup' => "users#new"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:index, :new, :create]
  get '/users/:id', to: 'users#show', as: 'user'
end
