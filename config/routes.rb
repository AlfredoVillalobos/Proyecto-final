Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get 'geocoder/localposittion'
  devise_for :users, controllers: {
    registrations:       'users/registrations',
    omniauth_callbacks:  'users/omniauth_callbacks'
  }
  #ActionCable
  mount ActionCable.server => '/cable'
  
  #Chat
  resources :chat_rooms, only: [:new, :create, :show, :index, :destroy]
  resources :users, only: [:index]
  root to: 'users#index'
  
  #Omniauth login with facebook and google
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup
  
end
