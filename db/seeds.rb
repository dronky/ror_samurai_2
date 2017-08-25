# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RailwayStation.create(title: "Moscow")
RailwayStation.create(title: "Kaluga")
route = Route.new
route.railway_stations << RailwayStation.first
route.railway_stations << RailwayStation.last
route.save
Train.create(route: Route.first, number: 1)
SitWagon.create(sit_seats: 10, train: Train.first, up_seats: 7, down_seats: 4)
User.create