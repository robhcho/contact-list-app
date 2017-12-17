Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # namespace :v1 do
  #   get '/contact_list' => 'contacts#contact_info'
  # end

  namespace :v2 do
    get '/contacts' => 'contacts#index'
    get '/contacts/:id' => 'contacts#show'
    post '/contacts' => 'contacts#create'
    patch '/contacts/:id' => 'contacts#update'
    delete '/contacts/:id' => 'contacts#destroy'

    post '/users' => 'users#create'
  end
end
