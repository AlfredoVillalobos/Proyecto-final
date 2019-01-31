# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# calles = ['Portofino 4311-4339, Las Condes, Región Metropolitana, Chile', 'Alsasua 905, Las Condes, Región Metropolitana, Chile', 'San Benito - Vasco de Gama 4477, Las Condes, Región Metropolitana, Chile', 'Av. Cristobal Colon 4943-4991, Las Condes, Región Metropolitana, Chile', 'Martín de Zamora 5829, Las Condes, Región Metropolitana, Chile', 'IV Centenario 596, Las Condes, Región Metropolitana, Chile', 'Nva Mayecura 1132, Las Condes, Región Metropolitana, Chile', 'intor Carlos Wood 7873, Las Condes, Región Metropolitana, Chile', 'Talavera de La Reina 983-989, Las Condes, Región Metropolitana, Chile']
# 10.times do |id|
#   User.create(
#       name: Faker::Name.first_name,
#       email: Faker::Internet.email,
#       confirmed_at: DateTime.now,
#       address: "#{calles[id]}",
#       password: "123456"
#   )
# end
A dminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?