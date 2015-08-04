Rails.application.routes.draw do
  root 'menu_pizzas#index'

  resources :menu_pizzas
  resources :toppings

  get 'menu/index'
  get 'welcome/about'
  get 'welcome/catering'
  get 'welcome/locations'
end
