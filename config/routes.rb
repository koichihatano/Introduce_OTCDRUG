Rails.application.routes.draw do
  root to: 'pharmacies#index'
  devise_for :users
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  resources :pharmacies
  resources :users, only: :show
end
