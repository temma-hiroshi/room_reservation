Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'home/index'
  
  get   'users/account', to: 'users#show'
  get   'users/profile', to: 'users#edit'
  patch 'users/profile', to: 'users#update'
  
  get   'rooms/index',   to: 'rooms#index'
  get   'rooms/new',     to: 'rooms#new'
  patch 'rooms/new',     to: 'rooms#create'
  get   'rooms/show',    to: 'rooms#show'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
