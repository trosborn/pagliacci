Rails.application.routes.draw do
  devise_for :users
  root 'menu#index'

  resources :menu_pizzas
  resources :toppings
  resources :salads

  get 'welcome/about'
  get 'welcome/catering'
  get 'welcome/locations'
end
