Rails.application.routes.draw do
  root to: 'user_pharmacies#index'
  devise_for :users
  resources :users, only: :show
  resources :pharmacies
  resources :user_pharmacies
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  resources :medicals
end
