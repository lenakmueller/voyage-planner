# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
Transportation.destroy_all
Accommodation.destroy_all
Activity.destroy_all
Trip.destroy_all
User.destroy_all
# Booking.destroy_all

fran = User.create(first_name: "Fran", last_name: "Rodrigo", nickname: "Muscles", email: "fran@gmail.com", password: "password", mobile_number: "00491786655349")
james = User.create(first_name: "James", last_name: "Bunyon", nickname: "Jim", email: "james@gmail.com", password: "password", mobile_number: "00491786655348")

greece = { title: "Greece 2023", location: "Athens Greece", departure: "23.05.2023", return_day: "02.06.2023", user: fran }
paris = { title: "Paris in Love", location: "Paris France", departure: "10.02.2023", return_day: "15.02.2023", user: fran }
canada = { title: "Oh Canada", location: "Vancouver Canada", departure: "10.07.2023", return_day: "31.07.2023", user: fran }
copenhagen = { title: "Copenhagen with friends", location: "Copenhagen Denmark", departure: "30.04.2023", return_day: "08.05.2023", user: fran }
norway = { title: "Christmas in Norway", location: "Lofoten Norway", departure: "18.12.2023", return_day: "29.12.2023", user: fran }
patagonia = { title: "Patagonia adventures", location: "Chile", departure: "10.10.2023", return_day: "01.11.2023", user: fran }
london = { title: "London calling", location: "London", departure: "13.03.2023", return_day: "20.03.2023", user: james }

# images = ["https://images.unsplash.com/photo-1523568129082-a8d6c095638e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=694&q=80", "https://images.unsplash.com/photo-1541264161754-445bbdd7de52?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", "https://images.unsplash.com/photo-1511489731872-324afc650052?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80", "https://images.unsplash.com/photo-1552560880-2482cef14240?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=743&q=80", "https://images.unsplash.com/photo-1507272931001-fc06c17e4f43?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", "https://images.unsplash.com/photo-1546569397-ab326af881f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=678&q=80"]

[greece, paris, canada, copenhagen, norway, patagonia].each do |attributes|
  # file = URI.open(images[index])
  trip = Trip.new(attributes)
  # trip.photos.attach(io: file, filename: "trip.png", content_type: "image/png")
  trip.save!
  puts "Created #{trip.title}"
end

[london].each do |attributes|
  # file = URI.open(images[index])
  trip = Trip.new(attributes)
  # trip.photos.attach(io: file, filename: "trip.png", content_type: "image/png")
  trip.save!
  puts "Created #{trip.title}"
end
