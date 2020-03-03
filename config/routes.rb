Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :show

  resources :projects do
    resources :comments, only: :create
  end

  resources :comments, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
