Awesootup::Application.routes.draw do

  resources :awesootup_modules


  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'homepages#show', :name => 'full'

  resources :homepages, :only => [:show]

end
