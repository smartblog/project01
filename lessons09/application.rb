require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'carriage'

class Application
  TYPE_FORMAT = /(cargo|passenger)/i

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def create_station
    puts 'Please enter the name of New Station'
    station_name = gets.chomp
    @stations << Station.new(station_name)
  rescue => e
    puts e.message
  end

  def create_train
    puts 'Please enter the number of New Train'
    train_number = gets.chomp
    puts 'Please enter type of Train: passenger or cargo'
    type = gets.chomp
    raise 'Type of Train is not valid' if type !~ TYPE_FORMAT
    @trains << PassengerTrain.new(train_number) if type == 'passenger'
    @trains << CargoTrain.new(train_number) if type == 'cargo'
  rescue => e
    puts e.message
  end

  def create_route
    list_stations
    puts 'Choice Index of Begin Station in Route'
    from_index = gets.chomp.to_i
    raise 'Error: Begin Station in route is nil' if Station.all[from_index].nil?
    puts 'Choice Index of End Station in Route'
    to_index = gets.chomp.to_i
    raise 'Error: End Station in route is nil' if Station.all[to_index].nil?
    @routes << Route.new(Station.all[from_index], Station.all[to_index])
  rescue => e
    puts e.message
  end

  def attach_route
    puts 'Attach Route to Train'
    puts 'Choice a Route'
    list_routes
    route_index = gets.chomp.to_i
    puts 'Please enter a Train Number'
    list_trains
    train_number = gets.chomp
    Train.all[train_number].addroute(@routes[route_index])
  rescue => e
    puts e.message
  end

  def add_carriage
    puts 'Add Carriage to Train'
    list_trains
    puts 'Please enter a Train Number'
    train_number = gets.chomp
    puts 'Please enter type of Carriage: passenger or cargo'
    type = gets.chomp
    raise 'Type of Train is not valid' if type !~ TYPE_FORMAT
    if type == 'passenger'
      puts 'Enter count of places in carriage'
      places = gets.chomp.to_i
      Train.all[train_number].add_carriages(PassengerCarriage.new(places))
    elsif type == 'cargo'
      puts 'Enter amount of cargo carriage'
      amount = gets.chomp.to_i
      Train.all[train_number].add_carriages(CargoCarriage.new(amount))
    end
  rescue => e
    puts e.message
  end

  def del_carriage
    puts 'Delete Carriage from Train'
    list_trains
    puts 'Please enter a Train Number'
    train_number = gets.chomp
    puts 'Please choice number of Carriage, what we want delete'
    Train.all[train_number].carriages.each_with_index { |carriage, index| puts "#{index} - #{carriage}" }
    i = gets.chomp.to_i
    Train.all[train_number].carriages.delete_at(i)
  rescue => e
    puts e.message
  end

  def transfer_train
    puts 'Transfer a Train'
    list_trains
    puts 'Please enter Train Number'
    train_number = gets.chomp
    raise "Train #{train_number} is not created" if Train.all[train_number].nil?
    puts "Back or Forward Transfer?\n 1 - Forward Transfer\n 2 - Back Transfer"
    number = gets.chomp.to_i
    case number
    when 1
      unless Train.all[train_number].transfer
        puts 'Transfer impossible bacause current station is end of route'
      end
    when 2
      unless Train.all[train_number].back_transfer
        puts 'Transfer impossible bacause current station is begin of route'
      end
    end
  rescue => e
    puts e.message
  end

  def list_trains_on_station
    list_stations
    puts 'Select a Station'
    station_number = gets.chomp.to_i
    Station.all[station_number].all_trains { |train| puts "#{train.number}, #{train.train_type}, Carriages: #{train.carriages.count}" }
  rescue => e
    puts e.message
  end

  def list_carriages_of_train
    list_trains
    puts 'Please enter Train Number'
    train_number = gets.chomp
    if Train.all[train_number].train_type == 'passenger'
      Train.all[train_number].all_carriages { |carriage, index| puts "#{index} - #{carriage.carriage_type}, Busy: #{carriage.busy_places}, Free: #{carriage.free_places}" }
    elsif Train.all[train_number].train_type == 'cargo'
      Train.all[train_number].all_carriages { |carriage, index| puts "#{index} - #{carriage.carriage_type}, Busy: #{carriage.busy_amount}, Free: #{carriage.free_amount}" }
    end
  rescue => e
    puts e.message
  end

  def fill_or_add
    list_trains
    puts 'Please enter Train Number'
    train_number = gets.chomp
    Train.all[train_number].all_carriages { |carriage, index| puts "#{index} - Type: #{carriage.carriage_type}" }
    puts 'Please enter Number of Carriage'
    index = gets.chomp.to_i
    if Train.all[train_number].carriages[index].carriage_type == 'cargo'
      puts 'Fill a carriage'
      puts 'Please enter amount to fill:'
      amount = gets.chomp.to_i
      Train.all[train_number].carriages[index].fill(amount)
    elsif Train.all[train_number].carriages[index].carriage_type == 'passenger'
      Train.all[train_number].carriages[index].take_place
    end
  rescue => e
    puts e.message
  end

  def list_stations
    Station.all.each_with_index { |station, index| puts "#{index} #{station}" }
  end

  def list_trains
    Train.all.each { |key, value| puts "#{key} - #{value}" }
  end

  def list_routes
    @routes.each_with_index { |route, index| puts "#{index} - #{route}" }
  end
end
