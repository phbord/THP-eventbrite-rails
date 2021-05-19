Rails.application.routes.draw do
  root 'events#index'
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  resources :events, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  resources :users, only: [:show]
  resources :attendances, only: [:index, :new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
