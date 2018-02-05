Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'

  resources :users
  resources :companies
  resources :shops
  resources :sales_agents
  resources :price_lists
  resources :price_types
  resources :product_types
  resources :product_groups
  resources :products do
    collection { post :import }
  end
  resources :brands
  resources :load_events, only: [:index, :show, :new, :create]
  resources :remainders
  resources :searches
  resources :order_headers
  resources :order_tables
  get 'home' => 'home#show'

  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      resources :companies, only: :show
      resources :remainders, only: :index
      resources :price_lists, only: :index
    end
  end

  root 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
