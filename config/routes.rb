Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'sensor/index'

  get 'sensor/new'
  post 'sensor/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
