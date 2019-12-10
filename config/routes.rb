Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:index, :new, :create]
  get '/users/:id', to: 'users#show', as: 'user'
end
