class Train
  attr_reader :number, :type, :carriages
  def initialize(number)
    @speed = 0
    @number = number
    @carriages = []
  end

  def speed
    @speed
  end

  def carriages
    @carriages
  end

  def go
    @speed = 50
  end

  def stop
    @speed = 0
  end

  def add_carriages(carriage)
    @carriages << carriage if @speed == 0 && carriage.carriage_type == self.train_type
  end

  def addroute(train_route)
    @index = 0
    @current_route = train_route
    current_station
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

  def back_transfer
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

  protected
  attr_writer :number, :type, :carriages

end

class PassengerTrain < Train
  def train_type
    "passenger"
  end
end

class CargoTrain < Train
  def train_type
    "cargo"
  end
end
