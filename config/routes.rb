Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'

  resources :users
  resources :companies
  resources :shops
  resources :sales_agents
  resources :price_types
  resources :product_types
  resources :product_groups
  resources :products
  get 'home' => 'home#show'

  root 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
