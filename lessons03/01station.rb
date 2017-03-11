class Station
  attr_accessor :name
  def initialize(name)
    @name = name
    @trains = {}
  end

  def arrive(train)
    @trains[train.number] = {type: train.type, carriages: train.carriages}
  end

  def list
    puts "All trains on station: #{@name}"
    @trains.each {|key, value| puts "Train: #{key}, #{value[:type]}, #{value[:carriages]} "}
  end

  def filter(traintype)
    puts "All #{traintype} trains on station: #{@name}"
    @trains.each {|key, value| puts "Train: #{key}, #{value[:type]}, #{value[:carriages]}" if value[:type] == traintype}
  end

  def departure(train)
    @trains.delete(train.number)
    puts "Departure train #{train.number} from Station: #{@name}"
  end
end

class Route
  attr_accessor :route
  def initialize(from, to)
    @from = from.name
    @to = to.name
    @route = []
    @route << from.name
    @route << to.name
  end

  def addtransit(transit)
    @route.insert(-2, transit.name)
  end

  def deltransit(transit)
    @transit.delete(transit)
  end

  def view
    puts @route
  end
end

class Train
  attr_accessor :number, :type, :carriages, :route, :prev_st, :current_st, :next_st
  def initialize(number, type, carriages)
    @train = {}
    @route = {}
    @speed = 0
    @number = number
    @type = type
    @carriages = carriages
    @train[number] = {type: type, carriages: carriages}
  end

  def view
    puts @train
  end

  def current_s
    puts @speed
  end

  def current_c
    puts @carriages
  end

  def go
    @speed = 50
  end

  def stop
    @speed = 0
  end

  def add_c
    @carriages += 1 if @speed == 0
  end

  def addroute(trainroute)
    @route = trainroute.route
    @@count = 1
    @current_st = @route[0]
  end

  def transfer
    puts "Train follow Route: #{@route}"
    @prev_st = @route[@@count-1]
    @current_st = @route[@@count]
    @next_st = @route[@@count+1]
    sleep 1
    puts "Transfer 0#{@@count}: Prev_st: #{@prev_st}, Curr_st: #{@current_st}, Next_st: #{@next_st}"
    @@count += 1
    if @@count == @route.count
      @@count = 1
      @route = []
      @next_st = nil
    end
  end

  def current_station
    puts "Current station #{@current_st}"
  end

  def next_station
    puts "Next station #{@next_st}"
  end

  def previos_station
    puts "Previos station #{@prev_st}"
  end
end

train01 = Train.new("ALM003", "passenger", 12)
train02 = Train.new("AST003", "cargo", 15)

station01 = Station.new("Almaty")
station02 = Station.new("Astana")
station03 = Station.new("Telekshi")
station01.arrive(train01)
station01.arrive(train02)
station01.list
station02.list

puts "Test ROUTE"

route01 = Route.new(station01, station02)
route01.view

route01.addtransit(station03)
route01.view

train01.addroute(route01)
train01.transfer
train01.current_station
train01.transfer
train01.current_station









