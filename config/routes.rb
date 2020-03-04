Rails.application.routes.draw do
  resources :posts_tags
  resources :friendships
  resources :comments
  resources :tags
  resources :posts
  resources :users
  
  get '/login' => "sessions#new" #new users having trouble staying logged in
  post '/sessions' => "sessions#create"
  get '/logout' => 'sessions#destroy'
  #need to put sessions destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
