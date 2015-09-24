Rails.application.routes.draw do
  resources :locations
  resources :menu_pizzas
  resources :toppings
  resources :salads
  resources :gelatos

  devise_for :users
  root 'welcome#index'
end
