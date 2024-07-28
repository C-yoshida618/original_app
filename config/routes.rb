Rails.application.routes.draw do
  devise_for :users
  
  root to: 'main#index'

  get 'main', to: 'main#index' # TOPページ
  get 'main/show', to: 'main#show', as: 'portfolio' # ポートフォリオページ

  get 'products', to: 'products#index' # オンラインページ
  get 'products/new', to: 'products#new' # 出品ページ

  get 'orders', to: 'orders#index'
  get 'orders/new', to: 'orders#new'

  resources :products do
    resources :orders, only: [:new, :create, :index]
  end

  resources :users do
    resources :orders, only: [:index]
  end

  resources :orders, only: [:show, :edit, :update, :destroy]
  end