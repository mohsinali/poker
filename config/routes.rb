Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :hands do
    collection do 
      post :identify
    end
  end
end
