Rails.application.routes.draw do
  root 'internships#index'
  get 'internships/show'
  get 'events/index'
  get 'events/show'
end
