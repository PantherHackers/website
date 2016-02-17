Rails.application.routes.draw do
  root 'pages#index'

  resources :pages
  resources :posts
  resources :events
end
