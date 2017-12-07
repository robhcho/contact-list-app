class V1::ContactsController < ApplicationController
  def contact_info
    first_contact = Contact.first
    render json: {
      name: first_contact.name,
      email: first_contact.email,
      phone_number: first_contact.phone_number
    }
  end

  # def all_contacts
  #   all_contacts = Contact.all
  #   contact_hashes = []
  #   i = 0

  #   all_contacts.length.times  do
  #     the_contact = {name: all_contacts[i].name}
  #   contact_hashes << the_contact
  #   i += 1
  #   end
  #   render json: contact_hashes
end
