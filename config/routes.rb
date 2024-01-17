Rails.application.routes.draw do
  get 'likes/new'
  get 'likes/create'
  get 'likes/destroy'
  root 'tops#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :posts do
    resources :gadgets
  end

  get 'search', to: 'posts#search'
end