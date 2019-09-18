Rails.application.routes.draw do
  devise_for :users
  root 'internships#index'
  get 'internships/show'


  resources :events
  resources :jobs
  resources :lessons
  resources :user_events, only: [:create, :destroy]
end
