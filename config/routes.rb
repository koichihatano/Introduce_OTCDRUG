Rails.application.routes.draw do
  root to: 'pharmacies#index'
  devise_for :users
  resources :pharmacies
  resources :users, only: :show
end
