Rails.application.routes.draw do

  resources :pets
  resources :owners
  get 'owners/new'

  get 'owners/create'

  devise_for :users
  resources :owners do
    resources :pets, shallow: true
  end
  root 'owners#index'
  
end
