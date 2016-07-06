Rails.application.routes.draw do

  devise_for :users
  resources :owners do
    resources :pets, shallow: true
  end
  root 'owners#index'
  
end
