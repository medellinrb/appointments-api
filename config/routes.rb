Rails.application.routes.draw do
  resources :appointments
  root 'appointments#index'
end
