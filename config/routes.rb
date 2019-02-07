Rails.application.routes.draw do
  get 'tags/create'
  get 'tags/destroy'
  get 'tags/index'
  get 'tags/show'
  
  root 'welcome#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/submit_news', to: 'news_items#new'
  get '/submit_post', to: 'microposts#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :microposts
  resources :news_items
 end
