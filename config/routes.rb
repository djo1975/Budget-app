Rails.application.routes.draw do
  devise_for :users
  root 'pages#splash'

  get 'splash', to: 'pages#splash'

  resources :categories do
    resources :transactions, only: %i[index new create], controller: 'transactions'
  end

  resources :users, only: [:index] do
    resources :categories
  end

  get '/categories/new', to: 'categories#new', as: 'new_category_form'

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
end
