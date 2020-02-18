Rails.application.routes.draw do
  resources :stories
  resources :favourites
  resources :users
  

  get '/user_favourites', to: 'users#user_favourites'
  get '/user_stories', to: 'users#user_stories'
  
end
