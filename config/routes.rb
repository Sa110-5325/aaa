Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :users
  resources :comments, only: [:create, :destroy]
  resources :shops do
    resource :favorites, only: [:create, :destroy]
  end
end
