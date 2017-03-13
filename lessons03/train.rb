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
    @index = 0
    @current_route = train_route
  end

  def transfer
    if @index < @current_route.route.count - 1
      @index += 1
      puts "Train #{@train} follow Route: #{@current_route.route} \n"
      self.previos_station.departure(self)
      self.current_station.arrive(self)
    else
      puts "Transfer impossible bacause current station is end of route"
    end
  end

  def reverse_transfer
    if @index > 0
      self.current_station.departure(self)
      self.previos_station.arrive(self)
      @index -= 1
    else
      puts "Transfer impossible bacause current station is end of reverse transfer"
    end
  end

  def current_station
    @current_route.route[@index]
  end

  def next_station
    @current_route.route[@index + 1]
  end

  def previos_station
    @current_route.route[@index - 1]
  end
end