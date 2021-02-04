Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  
  resources :users, only: [:show, :edit]
  resources :beans, only: [:index, :show, :edit, :new, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
