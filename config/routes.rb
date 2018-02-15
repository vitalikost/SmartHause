Rails.application.routes.draw do


  #get 'sensor/new'
  get 'sensor/show'
  get 'sensor/api'
  post 'sensor/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'sensor#index'
end
