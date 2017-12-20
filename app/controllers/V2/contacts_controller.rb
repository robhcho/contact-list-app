class V2::ContactsController < ApplicationController
  def index
    if current_user
      # contacts = Contact.where(user_id: current_user.id)
      contacts = current_user.contacts
      render json: contacts.as_json
    else
      render json: { message: 'log in to see your contacts' }
    end
    # group = Group.find_by(id: params[:input_group_id])
    # contacts = group.contacts
    # render json: contacts.as_json
  end

  def show
    id_number = params[:id]
    contact = Contact.find_by(id: id_number)
    render json: contact.as_json
  end

  def create
    contact = Contact.new(
      first_name: params['first_name'],
      last_name: params['last_name'],
      middle_name: params['middle_name'],
      email: params['email'],
      phone_number: params['phone_number'],
      bio: params['bio']
    )
    if contact.save
      render json: contact.as_json
    else
      render json: { error: contact.errors.full_messages }
    end
  end

  def update
    id_number = params[:id]
    contact = Contact.find_by(id: id_number)
    contact.first_name = params['first_name'] || contact.first_name
    contact.last_name = params['last_name'] || contact.last_name
    contact.email = params['email'] || contact.email
    contact.phone_number = params['phone_number'] || contact.phone_number
    contact.middle_name = params['middle_name'] || contact.middle_name
    contact.bio = params['bio'] || contact.bio
    if contact.save
      render json: contact.as_json
    else
      render json: { error: contact.errors.full_messages }
    end
  end

  def destroy
    id_number = params['id']
    contact = Contact.find_by(id: id_number)
    contact.delete
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