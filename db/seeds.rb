# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# gender = ["Masculino", "Feminino"]
# group_size = 10

# 5.times do

#   u = User.create(first_name: Faker::Name.name, last_name: Faker::Name.last_name, username: Faker::Name.prefix, about: Faker::Name.title, email: Faker::Internet.email, gender: gender.sample)

#   3.times do
#     Meeting.create(name: Faker::Name.name , city: Faker::Address.city, location: Faker::Address.street_address, duration: Faker::Time.between(2.days.ago, Date.today, :all), group_size: group_size , category: Faker::Team.sport, description: Faker::Lorem.sentence , date: Date.today, user: u)
#   end
# end


# trocar o NAME e DESCRIPTION da meeting
sports = [
["corrida", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502302422/correr_fljl0o.jpg" ],
["cross-fit", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502399582/Crossfit6_xpvp1g.jpg" ],
["dança", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502385562/wzdomlibvmaqqq63wjah.jpg"],

["escalada", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502384114/ci3l3cnannx8wm6ldayw.jpg" ],
["funcional", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502399667/funcional_xuhxl3.jpg" ],

["montanhismo", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502398972/montanhismo_ukqszb.jpg"],
["pilates", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502386509/bwitshdinnntknixkp6e.jpg" ],


["slack-line", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502325468/q2btltfhlhcawk9bswkf.jpg" ],

["spinning", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502393595/k2hjtf7xiluivcqngptz.jpg" ],
["volley", "http://res.cloudinary.com/dpg1ipkol/image/upload/v1502386957/ld9x7kus3lukuuzddukc.jpg" ]
]

sports.each do |sport|
  Category.create!(name: sport[0], photo: sport[1])
end
