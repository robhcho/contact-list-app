Rails.application.routes.draw do
  get '/contact_list' => 'contacts#contact_info'
  get '/all_contacts' => 'contacts#all_contacts'
end
