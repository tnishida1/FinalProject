Rails.application.routes.draw do

  devise_for :users
  resources :owners do
    resources :pets, shallow: true
    resources :posts, shallow: true
  end
  root 'posts#index'
  
end
