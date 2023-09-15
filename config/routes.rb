Rails.application.routes.draw do
  # resources :products

  resources :order_items
  get 'cart', to: 'cart#show', as: :cart_path
  # get 'categories/:id', to: 'categories#destroy'
  resources :categories
  	# resources :products
  # end
  root 'pages#home'
	get 'menu', to: 'menu#index'
	get 'search', to: 'menu#search'
  devise_for :users
  
  get 'home', to: "pages#home"
  get 'catering', to: 'pages#catering'
  get 'info'  , to: 'pages#info'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
