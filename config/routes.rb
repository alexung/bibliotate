Rails.application.routes.draw do

  #root "courses#index"
  root 'users#index'
  get '/auth', :to => 'users#auth'
  get '/callback', :to => 'users#callback'
  get '/type', :to => 'users#type'
  get '/stories/:id/commentsfeed/', :to => 'stories#comments_feed'
  get '/stories/:id/mostcommented/', :to => 'stories#most_commented'
  get '/stories/:id/activeusers/', :to => 'stories#active_users'
  post "/logout" => "sessions#destroy"
  post "/notifications" => "notifications#destroy"
  resources :users
  resources :enrollments
  resources :comments
  resources :courses
  resources :stories
  resources :hashtags
end
