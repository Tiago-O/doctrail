Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, except: [:index, :destroy]

  resources :docs, except [:destroy] do
    resources :versions, only: [:create] do
      resources :comments, only: [:create]
    end
  end

  resources :versions, except: [:create, :destroy]
  resources :comments, only: [:edit, :update, :destroy ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
