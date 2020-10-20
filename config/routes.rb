Rails.application.routes.draw do
  devise_for :users
  root  'home#index'
  resources :users, only:[:show]

  resources :home, only:[:index] do
    collection do
      get 'chat'
    end
  end
  resources :tweets, only: [:index, :new, :create, :show] do
    member do
      get 'discussion'
    end
  end
  
end
