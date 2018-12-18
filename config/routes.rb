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
  
  resources :users, only: [:new, :create, :show] do
    member do
      get :favorites
    end
   end
    
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
