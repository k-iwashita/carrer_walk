Rails.application.routes.draw do
  devise_for :users
  root 'internships#index'
  get 'internships/show'
end
