Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'internships#index'
  get 'internships/:id', to: 'internships#show'


  resources :events
  resources :jobs
  resources :lessons
  resources :user_events, only: [:create, :destroy]
end
