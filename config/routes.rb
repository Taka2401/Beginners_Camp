Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users

  root to: 'homes#top'
  get '/about' => 'homes#about'

  resources :camps, only: [:index, :show]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  resources :posts, only: [:index, :new, :create, :show, :destroy] do
  resource :favorites, only: [:create, :destroy]

  end

  resources :users, only: [:show, :edit, :update]
  get 'user/post/:id' => 'users#post', as: 'user_post'

end
