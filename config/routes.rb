Rails.application.routes.draw do
  resources :user_infos
  devise_for :users
  root to: 'pages#home'

  get 'profile', to: 'pages#profile'

end
