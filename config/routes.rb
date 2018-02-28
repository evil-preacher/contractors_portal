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
      resources :remainders, only: :index
      resources :price_lists, only: :index
      post 'categories/batch_create', to: 'categories#batch_create'
      delete 'categories/clear_all', to: 'categories#clear_all'
      post 'brands/batch_create', to: 'brands#batch_create'
      delete 'brands/clear_all', to: 'brands#clear_all'
    end
  end

  root 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
