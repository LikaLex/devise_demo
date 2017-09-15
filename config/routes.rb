Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  resources :users do
    patch :block, on: :member
    patch :unblock, on: :member
  end

  resources :documents

  # get 'users/:id'
  # get 'users'
  # get 'users/:id/new'
  # get 'users/:id/edit'
  # put 'users/'
  # patch 'users/:id'
  # delete 'users/:id'
end
