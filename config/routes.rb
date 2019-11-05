Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'events#index'

  resources :events
  resources :users
  resources :user_events, only: [:create, :destroy]
end
