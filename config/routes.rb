Rails.application.routes.draw do
  get 'sensor/index'

  get 'sensor/new'
  post 'sensor/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
