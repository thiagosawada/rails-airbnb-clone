# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gender = ["Masculino", "Feminino"]
group_size = 10

5.times do

  u = User.create(first_name: Faker::Name.name, last_name: Faker::Name.last_name, username: Faker::Name.prefix, about: Faker::Name.title, email: Faker::Internet.email, gender: gender.sample)

  3.times do
    Meeting.create(name: Faker::Name.name , city: Faker::Address.city, location: Faker::Address.street_address, duration: Faker::Time.between(2.days.ago, Date.today, :all), group_size: group_size , category: Faker::Team.sport, description: Faker::Lorem.sentence , date: Date.today, user: u)
  end
end


# trocar o NAME e DESCRIPTION da meeting
