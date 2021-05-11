Rails.application.routes.draw do

  devise_for :admin
  devise_for :users,
    path: '',
    path_names: {
      sign_up: '',
      sign_in: 'login',
      sign_out: 'logout',
      registration: "signup",
    }

  # ========= ユーザー(public)のルーティング ================
  scope module: :public do
  root to: 'homes#top'
  get '/about' => 'homes#about'

  resources :camps, only: [:index, :show]
  resources :camp_places, only: [:index, :show]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  resources :posts, only: [:index, :new, :create, :show, :destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
  get 'user/post/:id' => 'users#post', as: 'user_post'

  get '/search', to: 'search#search', as: 'search'

  end

   # ========= 管理者(admin)のルーティング ================
   namespace :admin do
    resources :camp_places, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :users, only: [:show, :edit, :update]
    get 'user/post/:id' => 'users#post', as: 'user_post'
  end

end
