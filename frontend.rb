require 'unirest'
require 'pp'

# response = Unirest.get('http://localhost:3000/contact_list')
# contact = response.body
# p "First Name: #{contact['name']},
#    Email: #{contact['email']},
#    Phone Number: #{contact['phone_number']}"

while true
  p 'Choose an option'
  p '[1] Show all contacts'
  p '[1b] View a contact in a particular group'
  p '[2] Show a particular contact'
  p '[3] Add a new contact'
  p '[4] Update a contact'
  p '[5] Delete a contact'
  p '[6] Sign up'
  p '[7] Log in'
  p '[8] Log out'
  p "Type 'exit' to leave"

  base_url = 'localhost:3000/v2'
  user_input = gets.chomp
  if user_input == '1'
    response = Unirest.get("#{base_url}/contacts")
    pp response.body
  elsif user_input == '1b'
    p 'Enter the id of the group you would like to see'
    user_group_id = gets.chomp
    response = Unirest.get("#{base_url}/contacts?input_group_id=#{user_group_id}")
    pp response.body
  elsif user_input == '2'
    p 'Which contact would you like to view?'
    id_number = gets.chomp
    response = Unirest.get("#{base_url}/contacts/#{id_number}")
    pp response.body
  elsif user_input == '3'
    the_params = {}
    p 'Enter the first name of new contact'
    the_params['first_name'] = gets.chomp
    p 'Enter the last name of new contact'
    the_params['last_name'] = gets.chomp
    p 'Enter the email address of new contact'
    the_params['email'] = gets.chomp
    p 'Enter the phone number of new contact'
    the_params['phone_number'] = gets.chomp
    p 'Enter the middle name of contact'
    the_params['middle_name'] = gets.chomp
    p 'Enter a short bio of the new contact'
    the_params['bio'] = gets.chomp
    # p 'Enter the address of contact'
    # the_params['address'] = gets.chomp
    response = Unirest.post("#{base_url}/contacts", parameters: the_params)
    pp response.body
  elsif user_input == '4'
    p 'Enter the id number of the contact you would like to update?'
    contact_id = gets.chomp
    response = Unirest.get("#{base_url}/contacts/#{contact_id}")
    # pp response.body
    contact = response.body
    the_params = {}
    p "Enter new first name of contact. it is currently #{contact['first_name']}"
    the_params['first_name'] = gets.chomp
      p "Enter new last name of contact. it is currently #{contact['last_name']}"
    the_params['last_name'] = gets.chomp
    p "Enter new email of contact. it is currently #{contact['email']}"
    the_params ['email'] = gets.chomp
    p "Enter new phone number of contact. it is currently #{contact['phone_number']}"
    the_params ['phone_number'] = gets.chomp
    p "Enter new middle name of contact. it is currently #{contact['middle_name']}"
    the_params ['middle_name'] = gets.chomp
      p "Enter the new bio of the new contact. it is currently #{contact['bio']}"
    the_params ['bio'] = gets.chomp
    the_params.delete_if{ |key, value| value.empty? }
    response = Unirest.patch("#{base_url}/contacts/#{contact_id}", parameters: the_params)
    pp response.body
  elsif user_input == '5'
    p 'Which contact would you like to delete?'
    id_number = gets.chomp
    response = Unirest.delete("#{base_url}/contacts/#{id_number}")
    p 'Contact has been deleted' 
  elsif user_input == '6'
    the_params = {}
    p 'Enter a username'
    the_params[:name] = gets.chomp
    p 'Enter your email address'
    the_params[:email] = gets.chomp
    p 'Enter a password'
    the_params[:password] = gets.chomp
    p 'Confirm your password'
    the_params[:password] = gets.chomp
    response = Unirest.post("#{base_url}/users", parameters: the_params)
    pp response.body
  elsif user_input == '7'
    p 'Enter your email address'
    user_email = gets.chomp
    p 'Enter your password'
    user_password = gets.chomp
    response = Unirest.post(
      'localhost:3000/user_token',
      parameters: {
        auth: {
          email: user_email,
          password: user_password
        }
      }
    )
    jwt = response.body['jwt']
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    p jwt
  elsif user_input == '8'
    jwt = ''
    Unirest.clear_default_headers()
    p jwt
  elsif user_input == 'exit'
    break
  end
end
