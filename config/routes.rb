Rails.application.routes.draw do

  get '/index' => 'welcome#index'

  resources :pets, only: [:create, :delete, :show]
  resources :users, only: [:show, :edit, :update]
  resources :favorites, only: [:index, :create, :delete]
  resources :shelters, only: [:index]

end
