Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/forecast', to: 'forecast#location'
      get '/backgrounds', to: 'background#location'
      get 'book-search', to: 'books#index'
      resources :users, only: [:create, :show] 
      resources :sessions, only: [:create]
    end
  end
end
