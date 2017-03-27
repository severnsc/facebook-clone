Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users, only: [:show, :index]
  resources :friendships, only: [:create, :destroy, :update]
  resources :posts, except: [:new]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :edit, :update, :destroy]
  root 'static_pages#home'
end
