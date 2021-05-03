Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  get 'homes/about'
  get 'posts/index'
  get 'posts/show'
  get 'posts/create'
  get 'posts/new'
  get 'camps/index'
  get 'camps/show'

end
