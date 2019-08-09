Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'

  resources :recipes

  resources :users, only: :none do
    resources :recipes, only: [:index]
  end

end
