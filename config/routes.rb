Rails.application.routes.draw do
  resources :posts do
    resources :comments, except: [:show]
  end
  resources :communities
  resources :subscribes, only: [:create, :destroy, :index]
  root "posts#index"
  devise_for :users
end
