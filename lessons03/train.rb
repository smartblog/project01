class Train
  attr_accessor :number, :type, :carriages, :route, :current_station
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
    @current_station = train_route.route[@index]
    @current_route = train_route
  end

  def transfer
    if @index < @current_route.route.count - 1
      @index += 1
      puts "Train #{@train} follow Route: #{@current_route.route} \n"
      @current_station = @current_route.route[@index]
      @current_route.route[@index-1].departure(self)
      @current_route.route[@index].arrive(self)
    else
      puts "Transfer impossible bacause current station is end of route"
    end
  end

  def reverse_transfer
    if @index == 0
      puts "Transfer impossible bacause current station is end of reverse transfer"
    else
      @index -= 1
      @current_station = @current_route.route[@index]
      @current_route.route[@index+1].departure(self)
      @current_route.route[@index].arrive(self)
    end
  end

  def next_station
    puts "Next station #{@current_route.route[@index + 1].name}"
  end

  def previos_station
    puts "Previos station #{@current_route.route[@index - 1].name}"
  end
end