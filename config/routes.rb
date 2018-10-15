Rails.application.routes.draw do
  resources :posts do
    resources :comments, except: [:show]
  end
  resources :communities
  resources :subscribes, only: [:create, :destroy, :index]
  root "posts#index"

  devise_for :users



  post 'up_voted', to: 'posts#up_voted'
  post 'down_voted', to: 'posts#down_voted'

  get 'about', to: 'static_pages#about'
  get 'press', to: 'static_pages#press'
  get 'rules', to: 'static_pages#rules'
end
