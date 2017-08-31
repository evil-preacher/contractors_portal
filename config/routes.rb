Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'

  resources :users
  get 'home' => 'home#show'

  root to: 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
