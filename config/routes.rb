Rails.application.routes.draw do

  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'welcome#home'

  resources :users, only: [:show, :new, :create, :edit] 
  resources :journals
  resources :entries
  resources :moods

  resources :journals do
    resources :entries
  end
 
  resources :entries do
    resources :moods 
  end
end
