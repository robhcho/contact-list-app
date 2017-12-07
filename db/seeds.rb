

contact = Contact.new(name: Faker::Name.first_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number)

p contact
