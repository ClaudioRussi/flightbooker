# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
flights = Flight.create([{start_datetime: DateTime.new(2016,10,25,14,15), flight_duration: 460},{start_datetime: DateTime.new(2016,10,25,18,15), flight_duration: 320}, {start_datetime: DateTime.new(2016,10,27,16,15),flight_duration: 120}])
airports= Airport.create([{code: "NYC"},{code: "MVD"},{code:"BSAS"},{code:"JPN"}])
airports[0].arriving_flights << flights[0]
airports[0].departing_flights << flights[1]
airports[0].save
airports[1].arriving_flights << flights[2]
airports[1].departing_flights << flights[0]
airports[1].save
airports[2].arriving_flights << flights[1]
airports[2].departing_flights << flights[2]
airports[2].save

