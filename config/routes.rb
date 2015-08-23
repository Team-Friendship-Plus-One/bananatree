Rails.application.routes.draw do
  get 'payment/index'

  post 'campaigns/pay'

  root 'home#index'
  # this is for users omniauth_callbacks controller:
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
    devise_scope :user do
    get 'signout', :to => 'devise/sessions#destroy'
  end

      resources :users


 match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


  get '/team' => 'home#team'
  resources :cities

  resources :campaigns do
    resources :donations
  end
  resources :clients

end
# Prefix Verb   URI Pattern                                          Controller#Action
#   root GET    /                                                    home#index
# campaign_donations GET    /campaigns/:campaign_id/donations(.:format)          donations#index
#        POST   /campaigns/:campaign_id/donations(.:format)          donations#create
# new_campaign_donation GET    /campaigns/:campaign_id/donations/new(.:format)      donations#new
# edit_campaign_donation GET    /campaigns/:campaign_id/donations/:id/edit(.:format) donations#edit
# campaign_donation GET    /campaigns/:campaign_id/donations/:id(.:format)      donations#show
#        PATCH  /campaigns/:campaign_id/donations/:id(.:format)      donations#update
#        PUT    /campaigns/:campaign_id/donations/:id(.:format)      donations#update
#        DELETE /campaigns/:campaign_id/donations/:id(.:format)      donations#destroy
# campaigns GET    /campaigns(.:format)                                 campaigns#index
#        POST   /campaigns(.:format)                                 campaigns#create
# new_campaign GET    /campaigns/new(.:format)                             campaigns#new
# edit_campaign GET    /campaigns/:id/edit(.:format)                        campaigns#edit
# campaign GET    /campaigns/:id(.:format)                             campaigns#show
#        PATCH  /campaigns/:id(.:format)                             campaigns#update
#        PUT    /campaigns/:id(.:format)                             campaigns#update
#        DELETE /campaigns/:id(.:format)                             campaigns#destroy
# user_donations GET    /users/:user_id/donations(.:format)                  donations#index
#        POST   /users/:user_id/donations(.:format)                  donations#create
# new_user_donation GET    /users/:user_id/donations/new(.:format)              donations#new
# edit_user_donation GET    /users/:user_id/donations/:id/edit(.:format)         donations#edit
# user_donation GET    /users/:user_id/donations/:id(.:format)              donations#show
#        PATCH  /users/:user_id/donations/:id(.:format)              donations#update
#        PUT    /users/:user_id/donations/:id(.:format)              donations#update
#        DELETE /users/:user_id/donations/:id(.:format)              donations#destroy
#  users GET    /users(.:format)                                     users#index
#        POST   /users(.:format)                                     users#create
# new_user GET    /users/new(.:format)                                 users#new
# edit_user GET    /users/:id/edit(.:format)                            users#edit
#   user GET    /users/:id(.:format)                                 users#show
#        PATCH  /users/:id(.:format)                                 users#update
#        PUT    /users/:id(.:format)                                 users#update
#        DELETE /users/:id(.:format)                                 users#destroy
# clients GET    /clients(.:format)                                   clients#index
#        POST   /clients(.:format)                                   clients#create
# new_client GET    /clients/new(.:format)                               clients#new
# edit_client GET    /clients/:id/edit(.:format)                          clients#edit
# client GET    /clients/:id(.:format)                               clients#show
#        PATCH  /clients/:id(.:format)                               clients#update
#        PUT    /clients/:id(.:format)                               clients#update
#        DELETE /clients/:id(.:format)                               clients#destroy
# donations GET    /donations(.:format)                                 donations#index
#        POST   /donations(.:format)                                 donations#create
# new_donation GET    /donations/new(.:format)                             donations#new
# edit_donation GET    /donations/:id/edit(.:format)                        donations#edit
# donation GET    /donations/:id(.:format)                             donations#show
#        PATCH  /donations/:id(.:format)                             donations#update
#        PUT    /donations/:id(.:format)                             donations#update
#        DELETE /donations/:id(.:format)                             donations#destroy
