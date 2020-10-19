Rails.application.routes.draw do
  devise_for :users
  root  'home#index'
  resources :tweets, only: [:index, :new, :create] do
    member do
      get 'discussion'
    end
  end
  
end
