class Train
  attr_accessor :number, :type, :carriages, :route
  def initialize(number, type, carriages)
    @speed = 0
    @number = number
    @type = type
    @carriages = carriages
  end

  def speed
    puts @speed
  end

  def carriages
    puts @carriages
  end

  def go
    @speed = 50
  end

  def stop
    @speed = 0
  end

  def add_carriages
    @carriages += 1 if @speed == 0
  end

  def addroute(train_route)
    @@index = 0
    @current_st = train_route.route[@@index]
    @current_route = train_route
  end

  def transfer
    @@index += 1
    puts "Train #{@train} follow Route: #{@current_route.route} \n"
    @current_st = @current_route.route[@@index]
    @current_route.route[@@index].departure
  end

  def current_station
    puts "Current station #{@current_route.route[@@index].name}"
  end

  def next_station
    puts "Next station #{@current_route.route[@@index + 1].name}"
  end

  def previos_station
    puts "Previos station #{@current_route.route[@@index - 1].name}"
  end
end