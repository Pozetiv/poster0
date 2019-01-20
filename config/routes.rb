require 'sidekiq/web'
Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root "posts#index"

  get 'messages/index'
  get 'conversations/index'

  resources :posts do
    resources :comments, except: [:show]
    member do
      get 'up_voted', to: 'posts#up_voted'
      get 'down_voted', to: 'posts#down_voted'
    end
  end
  get '/trends_month', to: 'posts#trends_month'

  resources :comments do
    resources :comments, except: [:show]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :communities do
    member do
      get 'subscribers', to: 'communities#list_users'
      post 'add_admin', to: 'communities#admin'
    end
  end

  resources :subscribes, only: [:create, :destroy, :index]

  devise_for :users
  resources :users do
    get 'profile', to: 'users#profile'
  end
  
  get 'about', to: 'static_pages#about'
  get 'press', to: 'static_pages#press'
  get 'rules', to: 'static_pages#rules'
end
