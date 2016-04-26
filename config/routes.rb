Rails.application.routes.draw do

  get '/index' => 'welcome#index'
  get '/one' => 'welcome#one'

  resources :pets, only: [:create, :delete, :show]
  resources :users, only: [:create, :show, :edit, :update]
  resources :favorites, only: [:index, :create, :delete]
  resources :shelters, only: [:index]
  post '/shelters/zip_code'

end
