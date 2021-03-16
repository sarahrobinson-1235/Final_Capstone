Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    post "/sessions" => "sessions#create"

    get "/posts" => "posts#index"
    post "/posts" => "posts#create"
    get "/posts/:id" => "posts#show"
    patch "/posts/:id" => "posts#update"
    delete "/posts/:id" => "posts#destroy"

    get "/boards" => "boards#index"
    post "/boards" => "boards#create"
    get "/boards/me" => "boards#current_user_index"
    get "/boards/:id" => "boards#show"
    patch "/boards/:id" => "boards#update"
    delete "/boards/:id" => "boards#destroy"
    

    post "/board_posts" => "board_posts#create"
    delete "/board_posts/:id" => "board_posts#destroy"
 

    get "/quote" => "quotes#daily"

  end
end
