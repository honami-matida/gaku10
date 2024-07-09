Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

   # Public Homes
  root 'public/homes#top'
  get 'about', to: 'public/homes#about', as: 'about'

  # Public Posts
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  # Public Post Comments
  resources :post_comments, only: [:create, :destroy]

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

  # Public Favorites
  resources :favorites, only: [:create, :destroy]

  # Public Groups
  resources :groups, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  # Public Searches
  resources :searches, only: [:search]

  # Admin Static Pages
  get 'public/static_pages/terms', to: 'public/static_pages#terms'

  # Admin Static Pages
  get 'admin/static_pages/terms', to: 'admin/static_pages#terms'

  # Admin Sessions
  resources :admin_sessions, only: [:new, :create, :destroy]

  # Admin Homes
  get 'admin', to: 'admin/homes#top'

  # Admin Posts
  resources :admin_posts, only: [:index, :show, :delete]

  # Admin Post Comments
  resources :admin_post_comments, only: [:index, :show, :delete]

  # Admin Genres
  resources :admin_genres, only: [:index, :create, :edit, :update]

  # Admin Customers
  resources :admin_customers, only: [:index, :show, :update]

  # Admin Groups
  resources :admin_groups, only: [:index, :show, :destroy]

  # Admin Searches
  resources :admin_searches, only: [:search]

end
