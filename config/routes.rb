Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  get '/products/' => 'products#index'
  get '/products/:id' => 'products#show'
  get '/products' => 'products#new'
  post '/products/' => 'products#create'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy' 

  get '/suppliers/' => 'suppliers#index'
  post '/suppliers/' => 'suppliers#create'

  post '/users/' => 'users#create'
  
  post '/orders/' => 'orders#create'
  
  get '/carted_products/' => 'carted_products#index'
  post '/carted_products/' => 'carted_products#create'

end

