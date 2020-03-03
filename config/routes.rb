Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'users#show'

  resources :projects, only: [:index, :show, :destroy] do
    resources :comments, only: [:index, :new, :create]
  end

  resources :users, only: [] do
    resources :projects, only: [:new, :create, :edit, :update]
  end

  resources :comments, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
