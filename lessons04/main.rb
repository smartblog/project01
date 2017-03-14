require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'carriage'

train01 = CargoTrain.new("ALM001")
train02 = PassengerTrain.new("AST003")

carriage01 = CargoCarriage.new
carriage02 = PassengerCarriage.new


train01.add_carriages(carriage01)
train02.add_carriages(carriage02)

puts "In #{train01} #{train01.carriages}"
puts "In #{train02} #{train02.carriages}"