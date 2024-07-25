Rails.application.routes.draw do
  devise_for :users
  
  root to: 'main#index'

  get 'main', to: 'main#new'
  
  resources :products do 
    resources :orders, only: [:new, :create]
end
  resources :orders, only: [:index, :show, :edit, :update, :destroy]

end