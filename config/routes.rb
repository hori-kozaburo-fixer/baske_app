Rails.application.routes.draw do
  devise_for :users
  root  'home#index'
  resources :tweets, only: [:index, :new, :create]
end
