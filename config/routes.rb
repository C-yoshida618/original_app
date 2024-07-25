Rails.application.routes.draw do
  devise_for :users
  root 'main#index'

  get 'portfolio', to: 'portfolio#index'
  resources :products, only: [:index, :show]

  get 'order_completed', to: 'order_completed#show'

  namespace :admin do
    resources :products
  end

  # 他のルーティング設定
end
