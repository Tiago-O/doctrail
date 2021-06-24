Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get 'about', to: 'pages#about'

  resources :users, only: [:edit, :update]
  get 'dashboard', to: 'pages#dashboard'

  resources :docs, except: [:destroy] do
    collection do
        get 'final'
      end
    resources :versions, only: [:create, :new, :index] do
      resources :comments, only: [:create]
    end
  end

  resources :versions, except: [:create, :destroy, :new, :index]
  resources :comments, only: [:edit, :update, :destroy ]
  resources :userdocs, only: [:create, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
