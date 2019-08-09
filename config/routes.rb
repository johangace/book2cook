Rails.application.routes.draw do
  devise_for :users

  get 'profile' => 'profile#index'
  post 'profile/:id/edit' => 'profile#edit'
  patch 'profile' => 'profile#update'
  
  get 'welcome/index'
  root 'welcome#index'

  resources :recipes

  resources :users, only: :none do
    resources :recipes, only: [:index]
  end
  
  resources :profile, only: [:index, :show, :edit, :update]

  
end
