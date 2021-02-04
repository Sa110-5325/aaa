Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  devise_for :users
  resources :beans, only: [:index, :show, :edit, :new, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
