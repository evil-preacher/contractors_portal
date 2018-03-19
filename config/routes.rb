Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'

  resources :users
  resources  :companies
  resources :shops, only: :index
  resources :sales_agents
  resources :price_lists, only: :index
  resources :price_types, only: :index
  resources :categories, only: :index
  resources :products, only: [:index, :show]
  resources :brands, only: :index
  resources :load_events, only: [:index, :show, :new, :create]
  resources :remainders, only: :index
  resources :searches
  resources :order_headers
  resources :order_tables
  get 'home' => 'home#show'

  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      resources :companies, only: :show
      post 'categories/batch_create', to: 'categories#batch_create'
      post 'brands/batch_create', to: 'brands#batch_create'
      get 'price_lists/index', to: 'price_lists#index'
      post 'price_lists/batch_create', to: 'price_lists#batch_create'
      post 'price_types/batch_create', to: 'price_types#batch_create'
      post 'shops/batch_create', to: 'shops#batch_create'
      post 'sales_agents/batch_create', to: 'sales_agents#batch_create'
      get 'remainders/index', to: 'remainders#index'
      post 'remainders/batch_create', to: 'remainders#batch_create'
      post 'products/batch_create', to: 'products#batch_create'
      post 'orders/create', to: 'order_headers#create'
    end
  end

  root 'home#show'
end
