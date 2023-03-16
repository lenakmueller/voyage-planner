require "open-uri"
Transportation.destroy_all
Accommodation.destroy_all
Activity.destroy_all
Trip.destroy_all
User.destroy_all



file = URI.open("https://kitt.lewagon.com/placeholder/users/FranRodrigo")
fran = User.new(first_name: "Fran", last_name: "Rodrigo", nickname: "Muscles", email: "fran@gmail.com", password: "password", mobile_number: "00491786655349")
fran.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
fran.save

file = URI.open("https://kitt.lewagon.com/placeholder/users/theactingdudejkb")
james = User.new(first_name: "James", last_name: "Bunyon", nickname: "Jim", email: "james@gmail.com", password: "password", mobile_number: "00491786655348")
james.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
james.save

file = URI.open("https://kitt.lewagon.com/placeholder/users/kulachokn")
anastasiia = User.new(first_name: "Anastasiia", last_name: "Kulachok", nickname: "Cheesecake", email: "anastasiia@gmail.com", password: "password", mobile_number: "00491786655322")
anastasiia.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
anastasiia.save

file = URI.open("https://kitt.lewagon.com/placeholder/users/lenakmueller")
lena = User.new(first_name: "Lena", last_name: "Müller", nickname: "Colors", email: "lena@gmail.com", password: "password", mobile_number: "00491786655348")
lena.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
lena.save

greece = { title: "Greece 2023", location: "Athens Greece", departure: "23.05.2023", return_day: "02.06.2023", user: fran }
paris = { title: "Paris in Love", location: "Paris France", departure: "10.02.2023", return_day: "15.02.2023", user: fran }
canada = { title: "Oh Canada", location: "Vancouver Canada", departure: "10.07.2023", return_day: "31.07.2023", user: fran }
copenhagen = { title: "Copenhagen with friends", location: "Copenhagen Denmark", departure: "30.04.2023", return_day: "08.05.2023", user: fran }
norway = { title: "Christmas in Norway", location: "Lofoten Norway", departure: "18.12.2023", return_day: "29.12.2023", user: fran }
patagonia = { title: "Patagonia adventures", location: "Chile", departure: "10.10.2023", return_day: "01.11.2023", user: fran }
london = { title: "London calling", location: "London", departure: "13.03.2023", return_day: "20.03.2023", user: james }

california = { title: "California Roadtrip", location: "Yosemite-Nationalpark", departure: "30.05.2023", return_day: "10.06.2023", user: lena }
cologne = { title: "Kölle for Karneval", location: "Köln", departure: "14.02.2023", return_day: "20.02.2023", user: lena }
scotland = { title: "Scotland 2022", location: "Edinburgh", departure: "10.11.2022", return_day: "15.11.2022", user: lena }
sevilla = { title: "Sevilla Birthday Trip", location: "Sevilla", departure: "19.09.2022", return_day: "24.09.2022", user: lena }
nyc = { title: "New York New York", location: "New York City", departure: "01.08.2022", return_day: "10.08.2022", user: lena }
baltic = { title: "Northern Germany Roadtrip", location: "Greifswald Mecklenburg-Vorpommern, Deutschland", departure: "23.05.2023", return_day: "02.06.2023", user: lena }


images = ["https://images.unsplash.com/photo-1523568129082-a8d6c095638e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=694&q=80", "https://images.unsplash.com/photo-1541264161754-445bbdd7de52?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", "https://images.unsplash.com/photo-1511489731872-324afc650052?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80", "https://images.unsplash.com/photo-1552560880-2482cef14240?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=743&q=80", "https://images.unsplash.com/photo-1507272931001-fc06c17e4f43?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", "https://images.unsplash.com/photo-1546569397-ab326af881f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=678&q=80"]

[greece, paris, canada, copenhagen, norway, patagonia].each_with_index do |attributes, index|
  file = URI.open(images[index])
  trip = Trip.new(attributes)
  trip.photo.attach(io: file, filename: "trip.png", content_type: "image/png")
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

[california, cologne, scotland, sevilla, nyc, baltic].each_with_index do |attributes, index|
  file = URI.open(images[index])
  trip = Trip.new(attributes)
  trip.photo.attach(io: file, filename: "trip.png", content_type: "image/png")
  trip.save!
  puts "Created #{trip.title}"
end

acc_greece = { departure: "24.04.2023", booking_ref: "AA123", location: "Psaron 31, Athina, Greece", return_day: "01.06.2023", notes: "Athens Mythology tour was fabulous, our guide was so engaging and a brilliant story teller", trip: greece }
act_greece = { name: "Tavern Klimataria", booking_ref: "Dinner", date: "27.05.2023", location: "Veranzerou 10, Athina, Greece", start_time: "18:00", end_time: "20:30", notes: "The tavern in Athens was very cosy and service very friendly", trip: greece }
trans_greece = { departure: "28.04.2023", transport_mode: 3, booking_ref: "qwe123", location: "Pl. Theatrou 2, Athina, Greece", notes: "Driver was super knowledgeable and very friendly.", return_day: "01.06.2023", trip: greece }

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


sevilla = Trip.where(location: "Edinburgh").first

acc_sevilla = { departure: "19.09.2023", booking_ref: "AA123", location: "Triana, Edinburgh, City of Edinburgh, Scotland", return_day: "24.09.2023", notes: "", trip: sevilla }
act_sevilla = { name: "Los Pacos", booking_ref: "Dinner", date: "20.09.2023", location: "Santa Cruz, Seville, Seville, Spain", start_time: "21:00", end_time: "22:30", notes: "", trip: sevilla }
trans_sevilla = { departure: "19.09.2023", transport_mode: 1, booking_ref: "qwe123", location: "Nervión, Seville, Seville, Spain", notes: ".", return_day: "24.09.2023", trip: sevilla }
act_sevilla2 = { name: "El Sella", booking_ref: "Lunch", date: "21.09.2023", location: "Calle Triana, Seville, Seville, Spain", start_time: "15:00", end_time: "16:30", notes: "", trip: sevilla }
trans_sevilla2 = { departure: "23.09.2023", transport_mode: 3, booking_ref: "FRG458", location: "Macarena, Seville, Seville, Spain", notes: "", return_day: "24.09.2023", trip: sevilla }

[acc_sevilla].each do |attributes|
  acc = Accommodation.new(attributes)
  acc.save!
  puts "Created #{acc.booking_ref}"
end

[act_sevilla, act_sevilla2].each do |attributes|
  act = Activity.new(attributes)
  act.save!
  puts "Created #{act.booking_ref}"
end

[trans_sevilla, trans_sevilla2].each do |attributes|
  trans = Transportation.new(attributes)
  trans.save!
  puts "Created #{trans.booking_ref}"
end



scotland = Trip.where(location: "Sevilla").first

acc_scotland = { departure: "10.11.2022", booking_ref: "GBD173", location: "Canongate, Edinburgh, EH8 8DD, United Kingdom", return_day: "15.11.2022", notes: "", trip: scotland }
act_scotland = { name: "The Scottish Engineer", booking_ref: "Dinner", date: "12.11.2022", location: "Queen Street,Edinburgh, EH2 1JX,United Kingdom", start_time: "18:00", end_time: "20:30", notes: "", trip: scotland }
trans_scotland = { departure: "11.11.2022", transport_mode: 1, booking_ref: "BUV856", location: "South Bridge,Edinburgh, EH1 1LL,United Kingdom", notes: ".", return_day: "14.11.2022", trip: scotland }
act_scotland2 = { name: "The Ben Nevis", booking_ref: "Lunch", date: "21.09.2023", location: "Leith Street,Edinburgh, EH1 3AT,United Kingdom", start_time: "13:00", end_time: "14:30", notes: "", trip: scotland }
trans_scotland2 = { departure: "15.11.2022", transport_mode: 2, booking_ref: "HFG647", location: "Stockbridge,EH4 1LY,Edinburgh,City of Edinburgh,Scotland,United Kingdom", notes: "", return_day: "15.11.2022", trip: scotland }

[acc_scotland].each do |attributes|
  acc = Accommodation.new(attributes)
  acc.save!
  puts "Created #{acc.booking_ref}"
end

[act_scotland, act_scotland2].each do |attributes|
  act = Activity.new(attributes)
  act.save!
  puts "Created #{act.booking_ref}"
end

[trans_scotland, trans_scotland2].each do |attributes|
  trans = Transportation.new(attributes)
  trans.save!
  puts "Created #{trans.booking_ref}"
end
