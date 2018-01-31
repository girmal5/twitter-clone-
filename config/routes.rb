Rails.application.routes.draw do

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users


resources :users do
  member do
    get :following, :followers
  end
end

resources :posts
resources :relationships


  root 'pages#index'

  get '/sendrequest/:id' => 'pages#sendrequest'

  get '/acceptrequest/:id' => 'pages#acceptrequest'


  get '/removerequest/:id' => 'pages#removerequest'

  get '/home' => 'pages#home'

  get '/user/:id' => 'pages#profile'

  get '/explore' => 'pages#explore'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
