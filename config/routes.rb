Rails.application.routes.draw do
  devise_for :users
  
  root to: 'main#index'

  get 'main', to: 'main#index' # TOPページ
  get 'main/show', to: 'main#show', as: 'portfolio' # ポートフォリオページ

  resources :products do
    resources :orders, only: [:new, :create, :index]
  end

  get 'orders#new', to: 'orders#new', as: 'order_complete'
end