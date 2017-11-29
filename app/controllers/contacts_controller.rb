class ContactsController < ApplicationController
  def contact_info
    contact_1 = Contact.first
    render json: { 
      name: contact_1.name,
      email: contact_1.email,
      phone_number: contact_1.phone_number
    }
  end
end
