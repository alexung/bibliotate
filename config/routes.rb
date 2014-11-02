Rails.application.routes.draw do

  #root "courses#index"
  root 'users#index'
  get '/auth', :to => 'users#auth'
  get '/callback', :to => 'users#callback'
  get '/type', :to => 'users#type'
  get '/stories/:id/commentsfeed/', :to => 'stories#commentsfeed'
  post "/logout" => "sessions#destroy"
  resources :users
  resources :enrollments
  resources :comments
  resources :courses
  resources :stories
  resources :hashtags
end
