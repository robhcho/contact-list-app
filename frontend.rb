require 'unirest'

# response = Unirest.get('http://localhost:3000/contact_list')
# contact = response.body
# p "First Name: #{contact['name']},
#    Email: #{contact['email']},
#    Phone Number: #{contact['phone_number']}"

p 'Choose an option'
p '[1] Show all contacts'
p '[2] Show a particular contact'
p '[3] Add a new contact'
p '[4] Update a contact'

base_url = 'localhost:3000/v2'
user_input = gets.chomp
if user_input == '1'
  response = Unirest.get("#{base_url}/contacts")
  p response.body
elsif user_input == '2'
  p 'Which contact would you like to view?'
  id_number = gets.chomp
  response = Unirest.get("#{base_url}/contacts/#{id_number}")
  p response.body
elsif user_input == '3'
  the_params = {}
  p 'Enter the name of new contact'
  the_params['name'] = gets.chomp
  p 'Enter the middle name of contact'
  the_params['middle_name']
  p 'Enter the email address of new contact'
  the_params['email'] = gets.chomp
  p 'Enter the phone number of new contact'
  the_params['phone_number'] = gets.chomp
  response = Unirest.post("#{base_url}/contacts", parameters: the_params)
  p response.body
# elsif user_input == '4'

#   the_params = {}
#   p 'Which contact would you like to update?'
#   id_number = gets.chomp
#   response = Unirest.get("#{base_url}/contacts/#{id_number}")
#   contact = response.body
#   p "Enter the contact's new name. Currently it is #{contact['name']}"
#   the_params['name'] = gets.chomp
#   p "Enter the contact's new email. Currently it is #{contact['email']}"
#   the_params['email'] = gets.chomp
#   p "Enter the contact's new phone_number. Currently it is #{contacts['phone_number']}"
#   the_params['phone_number'] = gets.chomp
#   the_params.delete_if{ |key, value| value.empty?}
end