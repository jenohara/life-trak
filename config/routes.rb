Rails.application.routes.draw do

  devise_for :users
  root 'welcome#home'
  #get 'welcome/home' => 'welcome#home'

  #get '/auth/google/callback' => 'sessions#create'
  
  #get '/signup' => "users#new"
  #get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'
  #delete '/logout' => 'sessions#destroy'
  #get '/users/edit' => 'devise/registrations#edit'
  #post '/users/edit' => 'devise/registrations#edit'

  resources :users , only: [:show, :new, :create, :edit]
  #get '/users/:id', to: 'users#show', as: 'user'
end
