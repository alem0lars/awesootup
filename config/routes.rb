Awesootup::Application.routes.draw do

  # by default show the full homepage
  root :to => 'homepages#show', name: 'full'

  # { resources
  resources :homepages, only: [:show]

  resources :contributes, only: [:show]

  resources :awesootup_modules
  # }

  # { (regular) user authentication
  match '/auth/:service/callback' => 'services#create', via: [:get, :post]
  match '/auth/failure' => 'services#failure', via: [:get, :post]
  match '/logout' => 'sessions#destroy', via: [:get, :delete], as: :logout

  resources :services, only: [:create, :destroy]
  # }

  # { administration
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  # }

end
#== Route Map
# Generated on 18 Jul 2013 11:26
#
#                                 root            /                                               homepages#show {:name=>"full"}
#                             homepage GET        /homepages/:id(.:format)                        homepages#show
#                           contribute GET        /contributes/:id(.:format)                      contributes#show
#                    awesootup_modules GET        /awesootup_modules(.:format)                    awesootup_modules#index
#                                      POST       /awesootup_modules(.:format)                    awesootup_modules#create
#                 new_awesootup_module GET        /awesootup_modules/new(.:format)                awesootup_modules#new
#                edit_awesootup_module GET        /awesootup_modules/:id/edit(.:format)           awesootup_modules#edit
#                     awesootup_module GET        /awesootup_modules/:id(.:format)                awesootup_modules#show
#                                      PUT        /awesootup_modules/:id(.:format)                awesootup_modules#update
#                                      DELETE     /awesootup_modules/:id(.:format)                awesootup_modules#destroy
#                                      GET|POST   /auth/:service/callback(.:format)               services#create
#                         auth_failure GET|POST   /auth/failure(.:format)                         services#failure
#                               logout GET|DELETE /logout(.:format)                               sessions#destroy
#                             services POST       /services(.:format)                             services#create
#                              service DELETE     /services/:id(.:format)                         services#destroy
#                           admin_root            /admin(.:format)                                admin/dashboard#index
#                                 root            /                                               dashboard#index
#         batch_action_admin_homepages POST       /admin/homepages/batch_action(.:format)         admin/homepages#batch_action
#                      admin_homepages GET        /admin/homepages(.:format)                      admin/homepages#index
#                                      POST       /admin/homepages(.:format)                      admin/homepages#create
#                   new_admin_homepage GET        /admin/homepages/new(.:format)                  admin/homepages#new
#                  edit_admin_homepage GET        /admin/homepages/:id/edit(.:format)             admin/homepages#edit
#                       admin_homepage GET        /admin/homepages/:id(.:format)                  admin/homepages#show
#                                      PUT        /admin/homepages/:id(.:format)                  admin/homepages#update
#                                      DELETE     /admin/homepages/:id(.:format)                  admin/homepages#destroy
#                      admin_dashboard            /admin/dashboard(.:format)                      admin/dashboard#index
# batch_action_admin_awesootup_modules POST       /admin/awesootup_modules/batch_action(.:format) admin/awesootup_modules#batch_action
#              admin_awesootup_modules GET        /admin/awesootup_modules(.:format)              admin/awesootup_modules#index
#                                      POST       /admin/awesootup_modules(.:format)              admin/awesootup_modules#create
#           new_admin_awesootup_module GET        /admin/awesootup_modules/new(.:format)          admin/awesootup_modules#new
#          edit_admin_awesootup_module GET        /admin/awesootup_modules/:id/edit(.:format)     admin/awesootup_modules#edit
#               admin_awesootup_module GET        /admin/awesootup_modules/:id(.:format)          admin/awesootup_modules#show
#                                      PUT        /admin/awesootup_modules/:id(.:format)          admin/awesootup_modules#update
#                                      DELETE     /admin/awesootup_modules/:id(.:format)          admin/awesootup_modules#destroy
#                   admin_translations            /admin/translations(.:format)                   admin/translations#index
#       batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)       admin/admin_users#batch_action
#                    admin_admin_users GET        /admin/admin_users(.:format)                    admin/admin_users#index
#                                      POST       /admin/admin_users(.:format)                    admin/admin_users#create
#                 new_admin_admin_user GET        /admin/admin_users/new(.:format)                admin/admin_users#new
#                edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)           admin/admin_users#edit
#                     admin_admin_user GET        /admin/admin_users/:id(.:format)                admin/admin_users#show
#                                      PUT        /admin/admin_users/:id(.:format)                admin/admin_users#update
#                                      DELETE     /admin/admin_users/:id(.:format)                admin/admin_users#destroy
#          batch_action_admin_comments POST       /admin/comments/batch_action(.:format)          admin/comments#batch_action
#                       admin_comments GET        /admin/comments(.:format)                       admin/comments#index
#                                      POST       /admin/comments(.:format)                       admin/comments#create
#                        admin_comment GET        /admin/comments/:id(.:format)                   admin/comments#show
#                batch_action_comments POST       /comments/batch_action(.:format)                comments#batch_action
#                             comments GET        /comments(.:format)                             comments#index
#                                      POST       /comments(.:format)                             comments#create
#                              comment GET        /comments/:id(.:format)                         comments#show
#               new_admin_user_session GET        /admin/login(.:format)                          active_admin/devise/sessions#new
#                   admin_user_session POST       /admin/login(.:format)                          active_admin/devise/sessions#create
#           destroy_admin_user_session DELETE|GET /admin/logout(.:format)                         active_admin/devise/sessions#destroy
#                  admin_user_password POST       /admin/password(.:format)                       active_admin/devise/passwords#create
#              new_admin_user_password GET        /admin/password/new(.:format)                   active_admin/devise/passwords#new
#             edit_admin_user_password GET        /admin/password/edit(.:format)                  active_admin/devise/passwords#edit
#                                      PUT        /admin/password(.:format)                       active_admin/devise/passwords#update
# 
# Routes for Jasminerice::Engine:
#            GET /spec/:spec_id/fixtures/*filename(.:format) jasminerice/spec#fixtures
# spec_index GET /spec(.:format)                             jasminerice/spec#index
#            GET /fixtures/*filename(.:format)               jasminerice/spec#fixtures
#            GET /(:suite)(.:format)                         jasminerice/spec#index
