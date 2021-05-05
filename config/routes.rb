Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get '/about' => 'homes#about'

  resources :camps, only: [:index, :show]
  resources :posts, only: [:index, :new, :create, :show, :destroy]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:show, :edit, :update]
  get 'user/post/:id' => 'users#post', as: 'user_post'

end
