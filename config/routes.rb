Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'

  resource :dashboard, only: [:show]
  resources :recipes, except: [:index]
  resource :search, only: [:show]
  resources :books do
    resource :purchase, only: [:create, :show]
    resource :cover, only: [:update, :show]
    resources :recipes, only: [:index] do
      resource :cookbook_entries, only: [:create, :destroy]
    end
  end

  resources :users, only: :none do
    resources :recipes, only: [:index]
  end

  resources :profiles, only: [:show, :edit, :update]
end
