Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'home/index'
  
  get   'users/account', to: 'users#show'
  get   'users/profile', to: 'users#edit'
  patch 'users/profile', to: 'users#update'
  
  resources :reservations, :only => [:index, :show, :create] do
    collection do
      post :confirm
    end
  end
  
  resources :rooms, :only => [:index, :show, :new, :create] do
    collection do
      get 'search'
    end
  end

end
