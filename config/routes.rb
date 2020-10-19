Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :user_infos, except: [:destroy]

  resources :categories

  resources :missions

  resources :habits


end
