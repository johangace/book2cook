Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'
  resources :recipes, except: [:index]

  resources :cover , except: [:index]


  resource :dashboard, only: [:show]

  resources :books do
     resources :cover, only: [:index]
    resources :recipes, only: [:index] do
      resource :cookbook_entries, only: [:create, :destroy]
    end
  end

  resources :users, only: :none do
    resources :recipes, only: [:index]
  end

  resources :profiles, only: [:show, :edit, :update]
end
