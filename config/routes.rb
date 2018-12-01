Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts do
    collection do 
      post :confirm
    end
    member do
      post :edit_confirm
    end
  end
end
