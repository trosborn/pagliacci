Rails.application.routes.draw do
  root 'welcome#index'

  resources :menu

  get 'welcome/about'
  get 'welcome/catering'
  get 'welcome/locations'
end
