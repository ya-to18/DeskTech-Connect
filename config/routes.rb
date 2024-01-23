Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
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

  resource :users, only: %i[new create show edit update] do
    collection do
      get 'posts'
      get 'likes'
    end
  end

  resources :posts do
    resources :gadgets
    resource :likes, only: %i[ create destroy ]
  end

  get 'search', to: 'posts#search'
end
