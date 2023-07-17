Rails.application.routes.draw do
  root 'rooms#top'
  get 'home/top'
  get 'users/account', to: 'users#account'
  get 'users/profile', to:  'users#profile'
  get 'users/profile/edit', to: 'users#edit_profile'
  patch 'users/profile/edit', to: 'users#update_profile'
  get 'rooms/own'
  get 'rooms/search', to: 'rooms#search'
  get 'rooms/top', to:'rooms#top'


  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }

  resources :rooms, except: [:edit, :update, :destroy]
end
