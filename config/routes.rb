Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'posts#index'
  resources :posts do
    collection do 
      post :confirm
    end
    member do
      post :edit_confirm
    end
  end
  
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
