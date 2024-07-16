Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #会員用
  root 'public/homes#top'
  get 'about', to: 'public/homes#about', as: 'about'

    # Public Customers
  resources :customers, only: [:show, :edit, :update] do
    member do
      get 'profile', to: 'public/customers#show', as: 'profile'
      get 'profile/edit', to: 'public/customers#edit', as: 'profile/edit'
      patch 'profile', to: 'public/customers#update'
      get 'unsubscribe', to: 'public/customers#unsubscribe', as: 'unsubscribe'
      patch 'withdraw', to: 'public/customers#withdraw', as: 'withdraw'
    end
  end

  namespace :public do

    # Public Posts
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end

    # Public Groups
    resources :groups, only: [:new, :create, :index, :show, :edit, :update, :destroy]

    # Public Searches
    resources :searches, only: [:search]

    # Public Static Pages
    get 'static_pages/terms', to: 'static_pages#terms'
  end

  # 管理者用
  namespace :admin do
    root to: 'homes#top'

    # Admin Sessions
    resources :sessions, only: [:new, :create, :destroy]

    # Admin Posts
    resources :posts, only: [:index, :show, :delete] do
      resources :post_comments, only: [:index, :show, :destroy]
    end

    # Admin Genres
    resources :genres, only: [:index, :create, :edit, :update]

    # Admin Customers
    resources :customers, only: [:index, :show, :update]

    # Admin Groups
    resources :groups, only: [:index, :show, :destroy]

    # Admin Searches
    get 'searches/search', to: 'searches#search', as: 'search'

    # Admin Static Pages
    get 'static_pages/terms', to: 'static_pages#terms'
  end
end
