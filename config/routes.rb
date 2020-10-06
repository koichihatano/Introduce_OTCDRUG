Rails.application.routes.draw do
  root to: 'pharmacies#index'
  devise_for :users
  resources :users, only: :show

  post '/homes/guest_sign_in', to: 'homes#new_guest'
  resources :pharmacies do
  resources :user_pharmacies
  resources :medicals
 end
end
