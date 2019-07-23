Rails.application.routes.draw do
  root 'internships#index'
  get 'internships/show'
end
