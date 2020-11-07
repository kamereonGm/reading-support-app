Rails.application.routes.draw do
  resources :events
  root "posts#index"
  get "users/login" => "sessions#loginform"
  post "users/signup" => "sessions#signup"
  post "users/create" => "sessions#create"
  post "logout" => "sessions#logout"
  get 'books/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "posts/index" => "posts#index"
  get "posts/search" => "posts#search"
  get "posts/shelf" => "posts#shelf"
  get "posts/shelfnow" => "posts#shelf"
  get "posts/shelf/:id" => "posts#show"
  post "posts/search" => "posts#search"
  post "posts/create" => "posts#create"
  post "posts/comment/:id" => "posts#comment"

  get "posts/timeline" => "connections#timeline"

end
