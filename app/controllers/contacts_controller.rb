class ContactsController < ApplicationController
  def contact_info
    contact_1 = Contact.first
    render json: {
      # message: "hello"
      # contact_info: Contact.first 
      name: contact_1.name
      # email: contact_1.
      }
  end
end
