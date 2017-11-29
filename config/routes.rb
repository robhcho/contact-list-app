Rails.application.routes.draw do
  get '/contact_list' => 'contacts#contact_info'
end
