Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  root to: 'homes#top'
  get '/about' => 'homes#about'
  

  resources :users, only: [:show, :edit, :update] do
    get 'beans' => 'users#index'
    get 'favorites' => 'favorites#index'
  end
  resources :beans, only: [:index, :show, :edit, :new, :create, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
