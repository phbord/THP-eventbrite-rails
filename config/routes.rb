Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/new'
    get 'users/create'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
  end
  root 'events#index'
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users

  namespace :admin do
    resources :users, :events
  end

  resources :events, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  resources :users, only: [:show]
  resources :attendances, only: [:index, :new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
