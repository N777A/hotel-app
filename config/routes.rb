Rails.application.routes.draw do
  root 'home#top'
  get 'home/top'
  get 'users/account', to: 'users#account'
  get 'users/profile', to:  'users#profile'
  get 'users/profile/edit', to: 'users#edit_profile'
  
  

  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
end
