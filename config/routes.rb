Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'home/index'
  
  get   'users/account', to: 'users#show'
  get   'users/profile', to: 'users#edit'
  patch 'users/profile', to: 'users#update'
  
  # get 'reservations/confirm', to: 'reservations#confirm'
  # post 'reservations/confirm', to: 'reservations#confirm'

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



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
