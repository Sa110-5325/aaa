Rails.application.routes.draw do
  get 'beans/index'
  get 'beans/show'
  get 'beans/edit'
  get 'beans/new'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
