Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users
  resources :users
  # get 'users/:id'
  # get 'users'
  # get 'users/:id/new'
  # get 'users/:id/edit'
  # put 'users/'
  # patch 'users/:id'
  # delete 'users/:id'
end
