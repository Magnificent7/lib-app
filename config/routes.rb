Rails.application.routes.draw do
  root "users#index" 
  resources :users, except: [:new]
  resources :libraries

  get "/users/:user_id/libraries" => "library_users#index", as: "user_libraries"
  post "/libraries/:library_id/users" => "library_users#create", as: "library_users"


  get "/signup" => "users#new", as: "new_user"
  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"
end

# Prefix Verb   URI Pattern               Controller#Action
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /signup(.:format)         users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
