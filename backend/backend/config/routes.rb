Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :registration, only: [:create]
  resources :sessions
  resources :recipes

  post '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#show'

  # get 'logged_in', to: 'sessions#is_logged_in?'
  post '/register', to: 'sessions#register'
  # post '/login', to: 'sessions#login'
  # delete '/logout', to: 'sessions#destroy'
  # get 'me', to: 'sessions#index'

  get '/me', to: 'users#show'
end
 