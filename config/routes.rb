Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'welcome#home'

  
  #get 'welcome/home' => 'welcome#home'
  
  #get '/signup' => "users#new"
  #get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'
  #delete '/logout' => 'sessions#destroy'
  #get '/users/edit' => 'devise/registrations#edit'
  #post '/users/edit' => 'devise/registrations#edit'

  resources :users, only: [:show, :new, :create, :edit]
  #get '/users/:id', to: 'users#show', as: 'user'
  resources :journals  #do 
    #resources :entries
  #end
end
