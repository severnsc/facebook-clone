Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  resources :friendships, only: [:create, :destroy]
  root 'static_pages#home'
end
