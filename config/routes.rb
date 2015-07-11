Rails.application.routes.draw do
  root 'welcome#index'

  resources :menu_pizzas
  resources :toppings

  get 'menu/index'
  get 'welcome/about'
  get 'welcome/catering'
  get 'welcome/locations'
end
