Rails.application.routes.draw do
  get 'rooms/index'
  root 'home#top'
  get 'home/top'
  get 'users/account', to: 'users#account'
  get 'users/profile', to:  'users#profile'
  get 'users/profile/edit', to: 'users#edit_profile'
  patch 'users/profile/edit', to: 'users#update_profile'
  get 'rooms/own'

  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }

  resources :rooms, except: [:edit, :update, :destroy]
end
