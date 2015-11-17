Rails.application.routes.draw do
  resources :beverages

  root 'welcome#index'

  get 'menu', to: 'menu#index'

  resources :addresses
  resources :locations
  resources :items do
    resources :sizes
  end
  resources :gelatos

  devise_for :users
end
