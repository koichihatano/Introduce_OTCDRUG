Rails.application.routes.draw do
  devise_for :users
  resources :pharmacies
  root to: 'pharmacies#index'
  resources :users, only: :show
end
