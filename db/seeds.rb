require "open-uri"
Transportation.destroy_all
Accommodation.destroy_all
Activity.destroy_all
Trip.destroy_all
User.destroy_all

fran = User.create(first_name: "Fran", last_name: "Rodrigo", nickname: "Muscles", email: "fran@gmail.com", password: "password", mobile_number: "00491786655349")
james = User.create(first_name: "James", last_name: "Bunyon", nickname: "Jim", email: "james@gmail.com", password: "password", mobile_number: "00491786655348")
anastasiia = User.create(first_name: "Anastasiia", last_name: "Kulachok", nickname: "Cheesecake", email: "anastasiia@gmail.com", password: "password", mobile_number: "00491786655322")
lena = User.create(first_name: "Lena", last_name: "Müller", nickname: "Colors", email: "lena@gmail.com", password: "password", mobile_number: "00491786655348")



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
  # trip.photo.attach(io: file, filename: "trip.png", content_type: "image/png")
  trip.save!
  puts "Created #{trip.title}"
end

greece = Trip.first

[london].each do |attributes|
  # file = URI.open(images[index])
  trip = Trip.new(attributes)
  # trip.photo.attach(io: file, filename: "trip.png", content_type: "image/png")
  trip.save!
  puts "Created #{trip.title}"
end

acc_greece = { departure: "24.04.2023", booking_ref: "AA123", location: "Psaron 31, Athina, Greece", return_day: "01.06.2023", notes: "notes", trip: greece }
act_greece = { name: "Tavern Klimataria", booking_ref: "Dinner", date: "27.05.2023", location: "Veranzerou 10, Athina, Greece", start_time: "18:00", end_time: "20:30", notes: "notes", trip: greece }
trans_greece = { departure: "28.04.2023", transport_mode: 3, booking_ref: "qwe123", location: "Pl. Theatrou 2, Athina, Greece", notes: "notes", return_day: "01.06.2023", trip: greece }

[acc_greece].each do |attributes|
  acc = Accommodation.new(attributes)
  acc.save!
  puts "Created #{acc.booking_ref}"
end

[act_greece].each do |attributes|
  act = Activity.new(attributes)
  act.save!
  puts "Created #{act.booking_ref}"
end

[trans_greece].each do |attributes|
  trans = Transportation.new(attributes)
  trans.save!
  puts "Created #{trans.booking_ref}"
end
