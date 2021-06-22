Rails.application.routes.draw do
  devise_for :admin,
             controllers: {
               sessions: 'admins/sessions',
               passwords: 'admins/passwords',
               registrations: 'admins/registrations',
             }
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               passwords: 'users/passwords',
               registrations: 'users/registrations',
             }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # ========= ユーザー(public)のルーティング ================
  scope module: :public do
    root to: 'camps#index'
    get '/about' => 'homes#about'

    resources :ranks, only: [:index]
    resources :tags, only: [:index, :show]
    resources :camps, only: [:index, :show]
    resources :camp_items, only: [:index, :show]
    resources :camp_places, only: [:index, :show]
    resources :camp_item_values, only: [:new, :create]
    resources :camp_place_values, only: [:new, :create]

    resources :camp_places, only: [:index, :show] do
      resources :reservations, only: [:new, :create]
      post 'reservations/confirm' => 'reservations#confirm'
      resources :camp_place_values, only: [:index, :new, :create, :show, :destroy]
    end

    resources :camp_items, only: [:index, :show] do
      resources :camp_item_values, only: [:index, :new, :create, :show, :destroy]
    end

    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      resources :reservations, only: [:index, :show]
      member do
        get 'following'
        get 'followers'
        get 'favorites'
        get 'post'
      end
    end
  end

  # ========= 管理者(admin)のルーティング ================
  namespace :admins do
    resources :reservations, only: [:index, :show]
    resources :camp_places
    resources :camp_items
    resources :users, only: [:index, :show]
  end
end
