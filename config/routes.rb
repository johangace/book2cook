Rails.application.routes.draw do
  get 'welcome/index'
  resources :recipes
  root 'welcome#index'
end
