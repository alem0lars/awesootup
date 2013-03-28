Awesootup::Application.routes.draw do

  root :to => 'homepages#show', :name => 'full'

  resources :homepages, :only => [:show]

end
