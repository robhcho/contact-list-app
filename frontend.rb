require 'unirest'

response = Unirest.get("http://localhost:3000/contact_list")
contact = response.body
p "First Name: #{contact['name']}, Email: #{contact['email']}, Phone Number: #{contact['phone_number']}"



