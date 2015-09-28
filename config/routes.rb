Rails.application.routes.draw do
  resources :addresses

  resources :locations
  resources :menu_pizzas
  resources :toppings
  resources :salads
  resources :gelatos

  devise_for :users
  root 'welcome#index'
end
