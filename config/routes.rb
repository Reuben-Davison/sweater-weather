Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/forecast', to: 'forecasts#index'
      get '/backgrounds', to: 'backgrounds#index'
      get 'book-search', to: 'books#index'
      post 'road_trip', to: 'trips#create'
      resources :users, only: [:create, :show] 
      resources :sessions, only: [:create]
      
    end
  end
end
