Rails.application.routes.draw do
  root to: 'user_pharmacies#index'
  devise_for :users
  resources :pharmacies
  resource :mypages, only: :show
  resources :user_pharmacies do
    get 'search'
  end
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  resources :medicals
end
