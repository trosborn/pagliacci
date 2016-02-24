Rails.application.routes.draw do
  root 'welcome#index'

  get 'menu', to: 'menu#index'
  get 'order', to: 'orders#home'
  get 'add_item', to: 'orders#add_item'

  resources :orders, :addresses, :locations, :beverages, :gelatos
  resources :items do
    resources :sizes
  end

  devise_for :users
end
