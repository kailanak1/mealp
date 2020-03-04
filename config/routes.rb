Rails.application.routes.draw do
  resources :posts_tags
  resources :friendships
  resources :comments
  resources :tags
  resources :posts
  resources :users
  
  get '/login' => "sessions#new" #new users having trouble staying logged in when they first sign up
  post '/sessions' => "sessions#create"
  get '/logout' => 'sessions#destroy'
  get '/search' => 'pages#search', :as => 'search_page'
  post '/search_results' => 'tags#search_results'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
