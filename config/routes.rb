Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'uploads#index'
  resources :uploads, only: [:index, :new, :create, :destroy]
end
