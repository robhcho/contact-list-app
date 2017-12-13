
Contact.destroy_all

10.times do
contact = Contact.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, middle_name: Faker::Name.first_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number)
contact.save
end
