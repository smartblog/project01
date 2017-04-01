require_relative 'application'

menu = Application.new

# demo data
Station.new('Almaty01')
Station.new('Astana01')
Station.new('Almaty02')

PassengerTrain.new('ALM-01')
CargoTrain.new('AST-01')

Train.all['ALM-01'].add_carriages(PassengerCarriage.new(50))
Train.all['AST-01'].add_carriages(CargoCarriage.new(500))
Train.all['AST-01'].add_carriages(CargoCarriage.new(700))

Train.all['ALM-01'].addroute(Route.new(Station.all[0], Station.all[1]))
Train.all['ALM-01'].transfer
# end demo data

loop do
  puts '------------------'
  puts 'Railway Main Menu:'
  puts '------------------'
  puts '1 - New Station'
  puts '2 - New Train'
  puts '3 - Create Route'
  puts '4 - Attach Route to Train'
  puts '5 - Add carriage to Train'
  puts '6 - Delete carriage from Train'
  puts '7 - Transfer Train'
  puts '8 - List of Stations'
  puts '9 - List Trains on Station'
  puts '10 - List Carriages of Train'
  puts '11 - Fill or AddPassengers to Carriage'
  puts '0 - Exit'
  number = gets.chomp.to_i
  break if number.zero?
  case number
  when 1
    menu.create_station
  when 2
    menu.create_train
  when 3
    menu.create_route
  when 4
    menu.attach_route
  when 5
    menu.add_carriage
  when 6
    menu.del_carriage
  when 7
    menu.transfer_train
  when 8
    menu.list_stations
  when 9
    menu.list_trains_on_station
  when 10
    menu.list_carriages_of_train
  when 11
    menu.fill_or_add
  end
end
