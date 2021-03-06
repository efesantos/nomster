Nomster::Application.routes.draw do
  
  get "photos/create"
  devise_for :users
  root 'places#index'

  resources :places do
    resources :comments, only: :create
    resources :photos, only: [:create, :destroy]
  end

  resources :users, only: :show do
    resources :comments, only: :destroy
  end


end
