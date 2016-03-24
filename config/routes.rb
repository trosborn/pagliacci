Rails.application.routes.draw do
  root 'welcome#index'

  get 'menu', to: 'menu#index'

  namespace :order do
    get '', to: 'orders#home'
    get 'home', to: 'orders#home'
    get 'add_item', to: 'orders#add_item'
    get 'added_item', to: 'orders#added_item'
    get 'location_select', to: 'orders#location_select'
    get 'location_selected', to: 'orders#location_selected'
    get '/orders/:id', to: 'orders#show', as: 'order'
    get 'checkout', to: 'cart#checkout'
    post 'complete', to: 'cart#complete'
    post 'update_location', to: 'orders#update_location'
    resources :items
  end

  devise_for :users

  resources :addresses, :locations
  namespace :admin do
    resources :items
    resources :locations
  end
end
