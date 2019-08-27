# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

contact = Contact.new(
  first_name: "Eddie", 
  last_name: "Lee", 
  email: "eddie@gmail.com", 
  phone_number: "3333333"
)
contact.save

contact = Contact.new(
  first_name: "Todd", 
  last_name: "Bisel", 
  email: "todd@gmail.com", 
  phone_number: "4444444"
)
contact.save

contact = Contact.new(
  first_name: "Jackie", 
  last_name: "Kartchner", 
  email: "jackie@gmail.com", 
  phone_number: "5555555"
)
contact.save