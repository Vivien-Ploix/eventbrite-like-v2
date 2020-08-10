# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  
require 'faker'

User.destroy_all
Attendance.destroy_all
Event.destroy_all


Faker::Config.locale = 'fr'



10.times do 
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Name.first_name+"@yopmail.com",
    description: Faker::Lorem.sentence
  )
end

10.times do
  event = Event.create(
    start_date: Faker::Time.forward(days: 45, format: :short),
    duration: rand(10..300)*5,
    description: Faker::Lorem.paragraph_by_chars(number: 150, supplemental: false),
    location: Faker::Address.city,
    price: rand(1..1000),
    title: Faker::TvShows::GameOfThrones.quote,
    admin_id: User.all.sample.id
  )
end

30.times do 
  attendance = Attendance.create(
    participant_id: User.all.sample.id,
    event_id: Event.all.sample.id
  )
end