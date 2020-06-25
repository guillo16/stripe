Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :categories
  resources :products
  resources :line_items
  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
