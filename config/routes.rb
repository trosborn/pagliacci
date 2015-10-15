Rails.application.routes.draw do
  resources :beverages

  root 'welcome#index'

  get 'menu', to: 'menu#index'

  resources :addresses
  resources :locations
  resources :menu_pizzas
  resources :toppings
  resources :salads
  resources :gelatos

  devise_for :users
end
