Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  resources :projects do
    resources :comments, only: [:index, :new, :create]
  end

  resources :comments, only: [:destroy]

  get '/profile', to: "pages#profile"

  root to: 'pages#home'
end
