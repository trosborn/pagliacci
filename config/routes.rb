Rails.application.routes.draw do
  root 'welcome#index'

  get 'menu', to: 'menu#index'

  namespace :order do
    get 'home', to: 'orders#home'
    get 'add_item', to: 'orders#add_item'
    resources :items
  end

  devise_for :users

  resources :addresses, :locations
  namespace :admin do
    resources :items
    resources :locations
  end
end
