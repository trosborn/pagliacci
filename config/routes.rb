Rails.application.routes.draw do
  root 'welcome#index'

  resource :menu
  resources :pizzas

  get 'welcome/about'
  get 'welcome/catering'
  get 'welcome/locations'
end
