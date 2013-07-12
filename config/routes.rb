Awesootup::Application.routes.draw do

  # { administration
  ActiveAdmin.routes(self)
  # }

  # { admin user authentication
  devise_for :admin_users, ActiveAdmin::Devise.config
  # }

  # { (regular) user authentication
  match '/auth/:service/callback' => 'services#create', via: [:get, :post]
  match '/auth/failure' => 'services#failure', via: [:get, :post]
  match '/logout' => 'sessions#destroy', via: [:get, :delete], as: :logout

  resources :services, only: [:create, :destroy]
  # }

  # { resources
  resources :homepages, only: [:show]

  resources :contributes, only: [:show]

  resources :awesootup_modules
  # }

  # by default show the full homepage
  root :to => 'homepages#show', name: 'full'

end
