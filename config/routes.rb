Rails.application.routes.draw do
  resources :friendships
  resources :comments
  resources :tags
  resources :posts
  resources :users
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
