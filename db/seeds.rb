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

trip_1 = Trip.new(assignee_id: user_1.id, owner_id: user_1.id, status_id: "0")


# Status.new(type: 0) # "Unstarted"

t.string :assignee_id
t.string :owner_id
t.datetime :ETA
t.datetime :ETC
t.string :status_id
t.string :action_id

puts "db/seeds.rb seeded"