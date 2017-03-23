Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit]
  root 'static_pages#home'
end
