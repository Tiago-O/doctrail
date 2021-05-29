Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, except: [:index, :new, :create]

  resources :docs do
    resources :versions, only: [:create] do
      resources :comments, only: [:create]
    end
  end

  resources :versions, except: [:create, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
