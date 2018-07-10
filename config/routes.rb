Rails.application.routes.draw do
  root to: 'properties#new'
  resources :properties, only: [:show, :new, :create]
  resources :property_types, only: [:show, :new, :create]
end
