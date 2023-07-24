# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "db/seeds.rb initializing"

user_1 = User.new(email: "user_1@utilizecore.com")
user_1.save

user_2 = User.new(email: "user_2@utilizecore.com")
user_2.save

puts "db/seeds.rb seeded"