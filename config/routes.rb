Rails.application.routes.draw do
  root "shopper#index", as: 'root'

  # post 'access/new', to:'access#new'
  # post 'access', to:'access#new'

  post 'access/new', to:'access#create'

  get 'access/new', to:'access#new'

  get 'login', to: 'access#new'

  get 'access/create'
  get 'authenticate', to: 'access#create'

  get 'access/destroy'
  get 'logout', to: 'access#destroy'

  delete 'logout', to: 'access#destroy'

  get 'admin/index'
  get 'admin', to: 'admin#index'

  resources :users
  resources :orders
  resources :lineitems
  resources :carts

  get 'shopper/index'
  get 'shopper', to: 'shopper#index'


  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


