Rails.application.routes.draw do
  devise_for :users
  
  root to: 'main#index'

  get 'main', to: 'main#index' # TOPページ
  get 'main/show', to: 'main#show', as: 'portfolio' # ポートフォリオページ

  resources :products do
    resources :orders, only: [:new, :create, :index]
  end

  # 注文完了ページ
  get 'order_complete', to: 'orders#complete'
end