class V2::ContactsController < ApplicationController
  def index
    contacts = Contact.all
    render json: contacts.as_json
  end

  def show
    id_number = params[:id]
    contact = Contact.find_by(id: id_number)
    render json: contact.as_json
  end

  def create
    contact = Contact.new(
      name: params['name'],
      middle_name: params['middle_name'],
      email: params['email'],
      phone_number: params['phone_number'],
      bio: params['bio']
    )
    contact.save

    render json: contact.as_json
  end

  def update
    contact = Contact.find_by(params[:id])
    contact.name = params['name'] || contact.name
    contact.email = params['email'] || contact.email
    contact.phone_number = params['phone_number'] || contact.phone_number
  end

  def delete
    id_number = params['id']
    contact = Contact.find_by(id: id_number)
    product.destroy
  end
  # def contact_info
  #   first_contact = Contact.first
  #   render json: {
  #     name: first_contact.name,
  #     email: first_contact.email,
  #     phone_number: first_contact.phone_number
  #   }
  # end

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