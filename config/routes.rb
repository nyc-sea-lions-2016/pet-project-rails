Rails.application.routes.draw do

  get '/index' => 'welcome#index'
  get '/one' => 'welcome#one'

  resources :pets, only: [:create, :destroy, :show]
  resources :users, only: [:create, :show, :edit, :update]
  resources :favorites, only: [:index, :create]
  resources :shelters, only: [:index]
  post '/shelters/zip_code'

end
