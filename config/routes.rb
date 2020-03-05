Rails.application.routes.draw do
  devise_for :users

  get '/users/:username', to: "users#show", as: :user
  # resources :users, only: [:show]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :projects do
    resources :comments, only: [:index, :new, :create]
  end

  resources :comments, only: [:destroy]

  get '/dashboard', to: "pages#dashboard"

  root to: 'pages#home'
end
