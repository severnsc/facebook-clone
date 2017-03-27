Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: [:show, :index]
  resources :friendships, only: [:create, :destroy, :update]
  resources :posts, except: [:new]
  resources :likes, only: [:create, :destroy]
  root 'static_pages#home'
end
