Rails.application.routes.draw do
  resources :user_infos
  devise_for :users
  root to: 'pages#home'


end
