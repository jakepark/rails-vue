# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "db/seeds.rb initializing"

user_1 = User.find_or_create_by(email: "user_1@utilizecore.com")
user_2 = User.find_or_create_by(email: "user_2@utilizecore.com")
user_3 = User.find_or_create_by(email: "user_3@utilizecore.com")

unstarted = Status.find_or_create_by(title: "unstarted")
in_progress = Status.find_or_create_by(title: "in_progress")
overdue = Status.find_or_create_by(title: "overdue")
complete = Status.find_or_create_by(title: "complete")


trip_1 = Trip.create(owner: user_1, assignee: user_1, status_id: unstarted.id, ETA: Time.now + 3.days, ETC: Time.now + 5.days)
trip_2 = Trip.create(owner: user_1, assignee: user_1, status_id: in_progress.id, ETA: Time.now + 5.days, ETC: Time.now + 7.days)
trip_3 = Trip.create(owner: user_1, assignee: user_1, status_id: overdue.id, ETA: Time.now + 6.days, ETC: Time.now + 8.days)
trip_4 = Trip.create(owner: user_1, assignee: user_1, status_id: complete.id, ETA: Time.now + 4.days, ETC: Time.now + 6.days)
trip_5 = Trip.create(owner: user_2, assignee: user_1, status_id: unstarted.id, ETA: Time.now + 7.days, ETC: Time.now + 9.days)
trip_6 = Trip.create(owner: user_3, assignee: user_1, status_id: unstarted.id, ETA: Time.now + 8.days, ETC: Time.now + 10.days)

puts "db/seeds.rb seeded"