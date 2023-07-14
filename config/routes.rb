Rails.application.routes.draw do

  get 'users/account', to: 'users#show'
  get 'users/profile', to:  'profiles#show'
  root 'home#top'
  get 'home/top'
  

  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
end
