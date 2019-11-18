Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookings, only: [:index, :show, :destroy] do
    resources :reviews, only: [:new, :create]
  end
  resources :pets, only: [:index, :show, :new, :create] do
   resources :bookings, only: [:new, :create]
  end
  resources :reviews, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
