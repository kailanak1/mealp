Rails.application.routes.draw do
  resources :posts_tags
  resources :friendships
  resources :comments
  resources :tags
  resources :posts
  resources :users
  
  get 'tags/:tag', to: 'posts#index', as: :tagged
  get '/login' => "sessions#new", as:"login" #new users having trouble staying logged in when they first sign up
  post '/sessions' => "sessions#create"
  get '/logout' => 'sessions#destroy'
  get '/search' => 'pages#search'
  post '/search_results' => 'pages#search_results'
  mount Commontator::Engine => '/commontator'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
