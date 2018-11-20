Rails.application.routes.draw do
  devise_for :users, controllers: {
        omniauth_callbacks: 'omniauth_callbacks'
      }

  mount ActionCable.server => '/cable'
  resources :chat_rooms, only: [:new, :create, :show, :index]
  root to: 'users#index'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
