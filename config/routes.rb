Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root to: 'main#index'

  get 'main', to: 'main#index' # TOPページ
  get 'main/show', to: 'main#show', as: 'portfolio' # ポートフォリオページ

  resources :products do
    resources :orders, only: [:index, :create, :show]
  end

  namespace :admin do
    resources :products
    resources :users, only: [:index, :edit, :update] # ユーザー管理のルーティング
  end
end
