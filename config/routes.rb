Rails.application.routes.draw do
  resources :messages
  resources :channels
  resources :users
  resources :groups
  resources :user_message_stars, only: :create
  resources :user_channel_stars, only: :create
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
