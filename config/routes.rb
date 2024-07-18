Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/pets" => "pets#index"
  get "/pets/new" => "pets#new"
  post "/pets" => "pets#create"
  get "/pets/:id" => "pets#show"
  get "/pets/:id/edit" => "pets#edit"
  patch "/pets/:id" => "pets#update"
  delete "/pets/:id" => "pets#destroy"

  # resources :pets // This method was suppose to call all the routes above in a single line

end
