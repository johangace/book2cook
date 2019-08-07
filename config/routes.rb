Rails.application.routes.draw do
  devise_for :users

  # get 'hello_world', to: 'hello_world#index'
  get 'welcome/index'
  resources :recipes
  root 'welcome#index'
end
