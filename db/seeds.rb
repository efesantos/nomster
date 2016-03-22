# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
40.times do |n|
  name = Faker::Company.name
  address = Faker::Address.street_name
  description = ["Fabulous", "Great spot", "Top rate",
                "I recommend", "Needs improvements",
                 "Not too bad", "Average"].sample

  user_id = rand(1..3)

  Place.create!(name: name, 
                address: address, 
                description: description,
                user_id: user_id)
end
=end

100.times do |n|
  
  message = Faker::Lorem.sentence(5)
  user_id = rand(1..3)
  place_id = rand(1..40)
  rating = ["1_star", "2_stars", "3_stars", "4_stars", "5_stars"].sample

  Comment.create!(message: message, 
                user_id: user_id,
                place_id: place_id,
                rating: rating)
end

#Comment.create!(message: Faker::Lorem.sentence(5), user_id: rand(1..3), place_id: rand(1..40), rating: ["1_star", "2_stars", "3_stars", "4_stars", "5_stars"].sample)


