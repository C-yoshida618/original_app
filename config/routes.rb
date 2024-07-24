Rails.application.routes.draw do
  root to: 'main#index'

  get 'portfolio', to: 'portfolio#index'
  get 'onlineshop', to: 'onlineshop#index'

  devise_for :users

  resources :orders, only: [:new, :create] do
    collection do
      get 'complete'
    end
  end

  namespace :admin do
    resources :products, only: [:new, :create, :edit, :update, :index, :destroy]
  end
end