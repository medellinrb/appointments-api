Rails.application.routes.draw do
  resources :appointments
  root 'appointments#index'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :appointments
    end
  end
end
