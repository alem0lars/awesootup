Awesootup::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'homepages#show', :name => 'full'

  resources :homepages, :only => [:show]

  resources :contributes, :only => [:show]

  resources :awesootup_modules

end
