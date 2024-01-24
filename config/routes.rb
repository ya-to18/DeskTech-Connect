Rails.application.routes.draw do
  root 'tops#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :password_resets, only: %i[ new create edit update ]
  get 'sended_mail', to: 'password_resets#sended_mail'

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

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
