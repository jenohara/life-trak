Rails.application.routes.draw do

  resources :mood_entries
  resources :moods
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'welcome#home'

  resources :users, only: [:show, :new, :create, :edit] 

  resources :journals do
    resources :entries
  end

  resources :entries
end
