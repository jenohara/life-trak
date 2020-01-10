Rails.application.routes.draw do

  root 'welcome#home'
  get 'welcome/home' => 'welcome#home'

  get '/auth/google/callback' => 'sessions#create'
  
  get '/signup' => "users#new"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users, only: [:index, :new, :create]
  get '/users/:id', to: 'users#show', as: 'user'
end
