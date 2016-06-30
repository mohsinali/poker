Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :hands do
    collection do 
      post :identify
    end
  end

  namespace :api do
    namespace :v1 do
      resources :hands
    end
  end  
end
