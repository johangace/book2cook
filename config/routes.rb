Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'

  resources :recipes
  resources :books 

  resources :users, only: :none do
    resources :recipes, only: [:index]
    resources :books, only: [:index]

  end
  
  resources :profiles, only: [:show, :edit, :update]
end
