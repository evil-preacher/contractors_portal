Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'

  resources :users
  resources  :companies
  resources :shops, only: :index
  resources :sales_agents
  resources :price_lists, only: :index
  resources :price_types, only: :index
  resources :categories, only: :index
  resources :products, only: [:index, :show] do
    collection { post :import }
  end
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
      delete 'categories/clear_all', to: 'categories#clear_all'
      post 'brands/batch_create', to: 'brands#batch_create'
      delete 'brands/clear_all', to: 'brands#clear_all'
      get 'price_lists/index', to: 'price_lists#index'
      post 'price_lists/batch_create', to: 'price_lists#batch_create'
      delete 'price_lists/clear_all', to: 'price_lists#clear_all'
      post 'price_types/batch_create', to: 'price_types#batch_create'
      delete 'price_types/clear_all', to: 'price_types#clear_all'
      post 'shops/batch_create', to: 'shops#batch_create'
      delete 'shops/clear_all', to: 'shops#clear_all'
      post 'sales_agents/batch_create', to: 'sales_agents#batch_create'
      delete 'sales_agents/clear_all', to: 'sales_agents#clear_all'
      get 'remainders/index', to: 'remainders#index'
      post 'remainders/batch_create', to: 'remainders#batch_create'
      delete 'remainders/clear_all', to: 'remainders#clear_all'
      post 'products/batch_create', to: 'products#batch_create'
      delete 'products/clear_all', to: 'products#clear_all'
    end
  end

  root 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
