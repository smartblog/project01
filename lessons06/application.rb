require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'carriage'

class Application
  TYPE_FORMAT = /(cargo|passenger)/i

  def initialize
    @routes = []
  end

  def create_station
    puts "Please enter the name of New Station"
    station_name = gets.chomp
    Station.new(station_name)
    rescue => e
      puts e.message
  end

  def create_train
    puts "Please enter the number of New Train"
    train_number = gets.chomp
    puts "Please enter type of Train: passenger or cargo"
    type = gets.chomp
    raise "Type of Train is not valid" if type !~ TYPE_FORMAT
    PassengerTrain.new(train_number) if type == "passenger"
    CargoTrain.new(train_number) if type == "cargo"
    rescue => e
      puts e.message
  end

  def create_route
    puts "List of Stations"
    list_stations
    puts "Choice Index of Begin Station in Route"
    from_index = gets.chomp.to_i
    raise "Error: Begin Station in route is nil" if Station.all[from_index].nil?
    puts "Choice Index of End Station in Route"
    to_index = gets.chomp.to_i
    raise "Error: End Station in route is nil" if Station.all[to_index].nil?
    @routes << Route.new(Station.all[from_index], Station.all[to_index])
    rescue => e
      puts e.message
  end

  def attach_route
    puts "Attach Route to Train"
    puts "Choice a Route"
    list_routes
    route_index = gets.chomp.to_i
    puts "Please enter a Train Number"
    list_trains
    train_number = gets.chomp
    Train.all[train_number].addroute(@routes[route_index])
    rescue => e
      puts e.message
  end

  def add_carriage
    puts "Add Carriage to Train"
    list_trains
    puts "Please enter a Train Number"
    train_number = gets.chomp
    puts "Please enter type of Carriage: passenger or cargo"
    type = gets.chomp
    raise "Type of Train is not valid" if type !~ TYPE_FORMAT
    Train.all[train_number].add_carriages(PassengerCarriage.new) if type == "passenger"
    Train.all[train_number].add_carriages(CargoCarriage.new) if type == "cargo"
    rescue => e
      puts e.message
  end

  def del_carriage
    puts "Delete Carriage from Train"
    list_trains
    puts "Please enter a Train Number"
    train_number = gets.chomp
    puts "Please choice number of Carriage, what we want delete"
    Train.all[train_number].carriages.each_with_index{|carriage, index| puts "#{index} - #{carriage}"}
    i = gets.chomp.to_i
    Train.all[train_number].carriages.delete_at(i)
    rescue => e
      puts e.message
  end

  def transfer_train
    puts "Transfer a Train"
    list_trains
    puts "Please enter Train Number"
    train_number = gets.chomp
    puts "Back or Forward Transfer?\n 1 - Forward Transfer\n 2 - Back Transfer"
    number = gets.chomp.to_i
    case number
      when 1
      raise "Transfer impossible bacause current station is end of route" if Train.all[train_number].transfer == false
      Train.all[train_number].transfer
      when 2
      raise "Transfer impossible bacause current station is begin of route" if Train.all[train_number].back_transfer == false
      Train.all[train_number].back_transfer
    end
    rescue => e
      puts e.message
  end

  def list_trains_on_station
    list_stations
    puts "Select a Station"
    station_number = gets.chomp.to_i
    puts Station.all[station_number].trains
    rescue => e
      puts e.message
  end

  def list_stations
    Station.all.each_with_index{|station, index| puts "#{index} - #{station}"}
  end

  def list_trains
    Train.all.each{|key, value| puts "#{key} - #{value}"}
  end

  def list_routes
    @routes.each_with_index{|route, index| puts "#{index} - #{route}"}
  end
end