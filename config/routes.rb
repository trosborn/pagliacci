Rails.application.routes.draw do
  root 'menu#index'

  resources :menu_pizzas
  resources :toppings
  resources :salads

  get 'menu/index'
  get 'welcome/about'
  get 'welcome/catering'
  get 'welcome/locations'
end
