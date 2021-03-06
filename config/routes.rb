Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'

  resources :users
  get 'sales_agents', to: 'users#sales_agents'
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
  resources :routes
  resources :searches
  resources :order_headers, only: [:index, :show]
  get 'home' => 'home#show'

  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      resources :companies, only: :show
      post 'categories/create', to: 'categories#create'
      post 'brands/create', to: 'brands#create'
      get 'price_lists/index', to: 'price_lists#index'
      post 'price_lists/create', to: 'price_lists#create'
      post 'price_types/create', to: 'price_types#create'
      post 'shops/create', to: 'shops#create'
      post 'sales_agents/create', to: 'sales_agents#create'
      get 'remainders/index', to: 'remainders#index'
      post 'remainders/create', to: 'remainders#create'
      post 'products/create', to: 'products#create'
      post 'orders/create', to: 'order_headers#create'
      post 'orders/mark_order', to: 'order_headers#mark_order'
      get  'orders/index', to: 'order_headers#index'
      post 'routes/create', to: 'routes#create'
      get  'routes/index', to: 'routes#index'
      post 'geodata/create', to: 'geodata#create'
      get  'geodata/index', to: 'geodata#index'
    end
  end

  root 'home#show'
end
