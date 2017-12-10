Rails.application.routes.draw do
  # namespace :v1 do
  #   get '/contact_list' => 'contacts#contact_info'
  # end

  namespace :v2 do
    get '/contacts' => 'contacts#index'
    get '/contacts/:id' => 'contacts#show'
    post '/contacts' => 'contacts#create'
    patch '/contacts/:id' => 'contacts#update'
    # destroy '/contacts/:id' => 'contacts#delete'
  end
end
