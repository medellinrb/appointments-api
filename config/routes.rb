Rails.application.routes.draw do
  devise_for :users
  resources :appointments
  root 'appointments#index'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :appointments
    end
  end
end
