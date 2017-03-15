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


  def list_stations
    @stations.each_with_index{|station, index| puts "#{index} - #{station}"}
  end

  def list_routes
    @routes.each_with_index{|route, index| puts "#{index} - #{route}"}
  end

  def list_trains
    @trains.each_with_index{|train, index| puts "#{index} - #{train}"}
  end

end