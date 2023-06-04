Rails.application.routes.draw do
  devise_for :users
  root 'pages#splash'

  get 'splash', to: 'pages#splash'
  get '/categories', to: 'categories#index', as: 'categories'

  resources :users, only: [:index] do
    resources :categories
  end

  get '/categories/new', to: 'categories#new', as: 'new_category'

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
end
