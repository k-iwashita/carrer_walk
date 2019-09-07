Rails.application.routes.draw do
  devise_for :users
  root 'internships#index'
  get 'internships/show'
  get 'events/index'
  get 'events/show'

  resources :jobs
  resources :lessons
end
