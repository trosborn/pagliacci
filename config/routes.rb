Rails.application.routes.draw do
  root 'welcome#index'

  get 'menu', to: 'menu#index'

  namespace :order do
    get '', to: 'orders#home'
    get 'home', to: 'orders#home'
    get 'checkout', to: 'cart#checkout'
    get 'add_item', to: 'orders#add_item'
    get 'added_item', to: 'orders#added_item'
    post 'review', to: 'cart#review'
    resources :items
  end

  devise_for :users

  resources :addresses, :locations
  namespace :admin do
    resources :items
    resources :locations
  end
end
