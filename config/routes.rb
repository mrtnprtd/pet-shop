Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # resources :pets // This method was suppose to call all the routes below in a single line

  get "/pets" => "pets#index"
  get "/pets/new" => "pets#new"
  post "/pets" => "pets#create"
  get "/pets/:id" => "pets#show"
  get "/pets/:id/edit" => "pets#edit"
  patch "/pets/:id" => "pets#update"
  delete "/pets/:id" => "pets#destroy"

# Routes for pet authentication

  get '/signup', to: 'pets#new_signup' # needed to render the signup form
  post '/signup', to: 'pets#signup'

  get '/login', to: 'pets#new_login' #needed to render the login form
  post '/login', to: 'pets#login'

  # Add root route
  #root "pets#index" # Sets the homepage to the pets index
end
