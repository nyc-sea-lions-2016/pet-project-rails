Rails.application.routes.draw do

  root 'welcome#index'

  resources :pets, only: [:create, :delete, :show, :index]
  resources :users, only: [:show, :edit, :update]
  resources :favorites, only: [:index, :create, :delete]

end
