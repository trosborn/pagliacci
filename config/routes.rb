Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/about'
  get 'welcome/menu'
  get 'welcome/catering'
  get 'welcome/locations'
end
