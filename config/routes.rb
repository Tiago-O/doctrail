Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update]

  resources :docs, except: [:destroy] do
    resources :versions, only: [:create, :new, :index] do
      resources :comments, only: [:create]
    end
  end

  resources :versions, except: [:create, :destroy, :new, :index]
  resources :comments, only: [:edit, :update, :destroy ]
  resources :userdocs, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
