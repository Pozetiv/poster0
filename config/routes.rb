Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :comments, except: [:show]
  end

  resources :communities
  get 'communities/:id/subscribers', to: 'communities#list_users', as: 'subscribers'
  post 'communities/:id/add_admin', to: 'communities#admin', as: 'add_admin'
  resources :subscribes, only: [:create, :destroy, :index]

  devise_for :users

  post 'up_voted', to: 'posts#up_voted'
  post 'down_voted', to: 'posts#down_voted'

  get 'about', to: 'static_pages#about'
  get 'press', to: 'static_pages#press'
  get 'rules', to: 'static_pages#rules'
end
