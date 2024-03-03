Rails.application.routes.draw do
  root 'tops#index'

  resource :tops, only: [] do
    collection do
      get 'terms_of_service'
      get 'privacy_policy'
    end
  end

  resource :users, only: %i[new create show edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  resource :my_page, only: [] do
    collection do
      get 'home', as: ''
      get 'liked'
      get 'my_posts'
    end
  end

  resources :password_resets, only: %i[ new create edit update ] do
    collection do
      get 'sended_mail'
      get 'after_setting'
    end
  end

  resources :posts do
    resources :gadgets
    resource :likes, only: %i[ create destroy ]
    resources :comments
    collection do
      get 'ranking'
      get 'rakuten_search'
    end
  end

  resources :autocomplete do
    collection do
      get :brand
      get :name
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
