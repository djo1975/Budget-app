Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#splash'

  get 'splash', to: 'pages#splash'

  # Defines the root path route ("/")
  resources :users, only: [:index] do # root "articles#index"
  end
end
