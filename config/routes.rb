Rails.application.routes.draw do
  get 'messages/index'
  get 'conversations/index'
  root "posts#index"

  resources :posts do
    resources :comments, except: [:show]
  end

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
    # resource :mail_boxes, only: [:show] do
    #   resources :direct_messages, only: [:new, :create, :destroy]
    # end
    get 'profile', to: 'users#profile'
  end

  post 'up_voted', to: 'posts#up_voted'
  post 'down_voted', to: 'posts#down_voted'

  get 'about', to: 'static_pages#about'
  get 'press', to: 'static_pages#press'
  get 'rules', to: 'static_pages#rules'
end
