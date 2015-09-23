Rails.application.routes.draw do
  get 'gelatos/new'

  get 'gelatos/index'

  get 'gelatos/create'

  get 'gelatos/update'

  get 'gelatos/destroy'

  get 'gelatos/save'

  devise_for :users
  root 'welcome#index'

  resources :menu_pizzas
  resources :toppings
  resources :salads
  resources :gelatos

  get 'welcome/about'
  get 'welcome/catering'
  get 'welcome/locations'
end
