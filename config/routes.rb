Rails.application.routes.draw do
  get 'my-pets', to: 'pets#my_pets', as: :my_pets
  devise_for :users
  root to: 'pets#index'
  resources :bookings, only: [:index, :show, :destroy] do
    resources :reviews, only: [:new, :create]
  end
  resources :pets, only: [:index, :show, :new, :create, :destroy] do
   resources :bookings, only: [:new, :create]
  end
  resources :reviews, only: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
