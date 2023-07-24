# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "db/seeds.rb initializing"

user_1 = User.create(email: "user_1@utilizecore.com")
user_2 = User.create(email: "user_2@utilizecore.com")

unstarted = Status.create(title: "unstarted")
started = Status.create(title: "started")
in_progress = Status.create(title: "in_progress")
overdue = Status.create(title: "overdue")

trip_1 = Trip.create(assignee_id: user_1.id, owner_id: user_1.id, status_id: unstarted.id)


puts "db/seeds.rb seeded"