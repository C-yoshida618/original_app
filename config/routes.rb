Rails.application.routes.draw do
  devise_for :users
  
  root to: 'main#index'

  get 'main', to: 'main#index' #TOPページ
  get 'main', to: 'main#new' #ポートフォリオページ
  get 'products', to: 'products#index' #オンラインページ
  get 'products', to: 'products#new' #出品ページ
  get 'orders', to: 'orders#index' #オンラインページ
  get 'orders', to: 'orders#new' #出品ページ
  
  resources :products do 
    resources :orders, only: [:new, :create]
end
  resources :users do
    resources :orders, only: [:index]
end

  resources :orders, only: [:show, :edit, :update, :destroy]
end  