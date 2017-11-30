class ContactsController < ApplicationController
  def contact_info
    contact_1 = Contact.first
    render json: { 
      name: contact_1.name,
      email: contact_1.email,
      phone_number: contact_1.phone_number
    }
  end

  def all_contacts
    all_contacts = Contact.all
    render json: {
      # message: "hi"
      first_person: all_contacts[0],
      second_person: all_contacts[1],
      third_person: all_contacts[2]

    }  
  end
end
