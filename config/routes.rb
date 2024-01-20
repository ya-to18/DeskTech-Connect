Rails.application.routes.draw do
  get 'likes/new'
  get 'likes/create'
  get 'likes/destroy'
  root 'tops#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :autocomplete do
    get :brand, on: :collection
    get :name, on: :collection
  end
  resources :users, only: %i[new create]
  resources :posts do
    resources :gadgets
    resource :likes, only: %i[ create destroy ]
  end

  get 'search', to: 'posts#search'
end
