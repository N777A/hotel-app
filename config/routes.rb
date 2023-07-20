Rails.application.routes.draw do
  root 'rooms#top'
  # users
  get 'users/account', to: 'users#account'
  get 'users/profile', to:  'users#profile'
  get 'users/profile/edit', to: 'users#edit_profile'
  patch 'users/profile/edit', to: 'users#update_profile'
  # rooms
  get 'rooms/own', to: 'rooms#own'
  get 'rooms/search', to: 'rooms#search'
  get 'rooms/top', to: 'rooms#top'
  #reservations
  get 'reservations/index', to: "reservations#index"
  post 'reservations/confirm', to: 'reservations#confirm'
  post 'reservations/create', to: 'reservations#create'
  
  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
  resources :rooms, except: [:edit, :update, :destroy, :index]
end
