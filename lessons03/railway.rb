require "./station.rb"
require "./route.rb"
require "./train.rb"

train01 = Train.new("ALM001", "passenger", 12)
train02 = Train.new("AST003", "cargo", 15)
train03 = Train.new("AST006", "cargo", 25)

station01 = Station.new("Almaty")
station02 = Station.new("Astana")
station03 = Station.new("Telekshi")
station04 = Station.new("Kalkaman")
station01.arrive(train01)
station01.arrive(train02)
station02.arrive(train03)
station01.list
station02.list

puts "Test ROUTE"

route01 = Route.new(station01, station02)

route01.addtransit(station03)
route01.addtransit(station04)
route01.view

train01.addroute(route01)
train01.transfer
puts "-------------------------------"
station01.list

train01.current_station
train01.transfer
train01.current_station