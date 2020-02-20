Rails.application.routes.draw do
  resources :stories
  resources :favourites
  resources :users
  
  # post '/users', to: 'users#create'
  get '/user_favourites', to: 'users#user_favourites'
  get '/user_stories', to: 'users#user_stories'
  post '/login', to: 'users#login'
  get '/validate', to: 'users#validate'
  
end
