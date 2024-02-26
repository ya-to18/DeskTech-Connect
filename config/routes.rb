Rails.application.routes.draw do
  root 'tops#index'
  get 'terms_of_service', to: 'tops#terms_of_service'
  get 'privacy_policy', to: 'tops#privacy_policy'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  get 'my_page', to: 'my_pages#my_page'
  get 'my_page/posts', to: 'my_pages#my_posts'
  get 'my_page/liked', to: 'my_pages#liked'

  resources :password_resets, only: %i[ new create edit update ]
  get 'sended_mail', to: 'password_resets#sended_mail'
  get 'after_setting', to: 'password_resets#after_setting'

  resources :autocomplete do
    get :brand, on: :collection
    get :name, on: :collection
  end

  resource :users, only: %i[new create show edit update]

  get 'rank', to: 'posts#ranking'
  resources :posts do
    resources :gadgets
    resource :likes, only: %i[ create destroy ]
  end

  get 'rakuten_search', to: 'posts#rakuten_search'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
