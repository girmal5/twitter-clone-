Rails.application.routes.draw do

  resources :friendships
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


  get '/home' => 'pages#home'

  get '/user/:id' => 'pages#profile'

  get '/explore' => 'pages#explore'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
