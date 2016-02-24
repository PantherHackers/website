Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #map.connect '', :controller => "pages", :action => "default"

  resources :pages
  resources :posts
  resources :events
end
