Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  resources :messages
  resources :channels
  resources :users
  resources :groups
  resources :user_message_stars, only: :create
  resources :user_channel_stars, only: :create
  
  get '/group_ids/:group_prefix', to: 'groups#show_id'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
