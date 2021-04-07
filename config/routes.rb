Rails.application.routes.draw do
  devise_for :users
  root to: "menus#index"
  resources :menus, only:[:index, :new, :create]
  post '/menus/guest_sign_in', to: 'menus#new_guest'
  resources :dinners, only:[:index, :new, :create, :show]
end
