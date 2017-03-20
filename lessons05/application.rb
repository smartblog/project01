require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'carriage'

class Application
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def create_station
    puts "Please enter the name of New Station"
    station_name = gets.chomp
    @stations << Station.new(station_name)
    puts @stations
  end

  def create_train
    puts "Please enter the number of New Train"
    train_number = gets.chomp
    puts "Please choice type of Train\n 1 - Passenger\n 2 - Cargo"
    number = gets.chomp.to_i
    case number
      when 1
      @trains << PassengerTrain.new(train_number)
      when 2
      @trains << CargoTrain.new(train_number)
    end
    puts @trains
  end

  def create_route
    puts "List of Stations"
    list_stations
    puts "Choice Index of Begin Station in Route"
    from_index = gets.chomp.to_i
    puts "Choice Index of End Station in Route"
    to_index = gets.chomp.to_i
    @routes << Route.new(@stations[from_index], @stations[to_index])
    puts @routes
  end

  def attach_route
    puts "Attach Route to Train"
    puts "Choice a Route"
    list_routes
    route_index = gets.chomp.to_i
    puts "Choice a Train"
    list_trains
    train_index = gets.chomp.to_i
    @trains[train_index].addroute(@routes[route_index])
  end

  def add_carriage
    puts "Add Carriage to Train"
    list_trains
    puts "Please choice a Train"
    train_number = gets.chomp.to_i
    puts "Please choice type of Carriage\n 1 - Passenger\n 2 - Cargo"
    number = gets.chomp.to_i
    case number
      when 1
      @trains[train_number].add_carriages(PassengerCarriage.new)
      when 2
      @trains[train_number].add_carriages(CargoCarriage.new)
    end
    puts @trains[train_number].carriages
  end

  def del_carriage
    puts "Delete Carriage from Train"
    list_trains
    puts "Please choice a Train"
    train_number = gets.chomp.to_i
    puts "Please choice number of Carriage, what we want delete"
    @trains[train_number].carriages.each_with_index{|carriage, index| puts "#{index} - #{carriage}"}
    i = gets.chomp.to_i
    @trains[train_number].carriages.delete_at(i)
  end

  def transfer_train
    puts "Transfer a Train"
    list_trains
    puts "Please choice a Train"
    train_number = gets.chomp.to_i
    puts "Back or Forward Transfer?\n 1 - Forward Transfer\n 2 - Back Transfer"
    number = gets.chomp.to_i
    case number
      when 1
      @trains[train_number].transfer
      when 2
      @trains[train_number].back_transfer
    end
  end

  def list_trains_on_station
    puts "Select a Station"
    list_stations
    station_number = gets.chomp.to_i
    @stations[station_number].list
  end

  def list_stations
    @stations.each_with_index{|station, index| puts "#{index} - #{station}"}
  end

  def list_routes
    @routes.each_with_index{|route, index| puts "#{index} - #{route}"}
  end

  def list_trains
    puts "List of Trains"
    @trains.each_with_index{|train, index| puts "#{index} - #{train}"}
  end

end