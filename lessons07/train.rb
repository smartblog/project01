require_relative 'manufacturer'
require_relative 'instancecounter'

class Train
  include Manufacturer
  include InstanceCounter::InstanceMethods
  extend InstanceCounter::ClassMethods

  attr_reader :number, :type, :carriages

  NUMBER_FORMAT = /^[0-9a-z]{3}-?[0-9a-z]{2}/i
  @@all_trains = {}

  def initialize(number)
    @speed = 0
    @number = number
    validate!
    @carriages = []
    @@all_trains[number] = self
    register_instance
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
    raise "Train unsupport this carriage type" if carriage.carriage_type != self.train_type
    @carriages << carriage if @speed == 0 && carriage.carriage_type == self.train_type
  end

  def addroute(train_route)
    @index = 0
    @current_route = train_route
    current_station
  end

  def transfer
    if @index < @current_route.stations.count - 1
      @index += 1
      self.previos_station.departure(self)
      self.current_station.arrive(self)
    else
      false
    end
  end

  def back_transfer
    if @index > 0
      self.current_station.departure(self)
      self.previos_station.arrive(self)
      @index -= 1
    else
      false
    end
  end

  def current_station
    @current_route.stations[@index]
  end

  def next_station
    @current_route.stations[@index + 1]
  end

  def previos_station
    @current_route.stations[@index - 1]
  end

  def self.find(number)
    @@all_trains[number]
  end

  def self.all
    @@all_trains
  end

  def valid?
    validate!
  rescue
    false
  end

  def all_carriages(&block)
    @carriages.each_with_index{|carriage, index| block.call(carriage, index)}
  end

  protected
  attr_writer :number, :type, :carriages

  def validate!
    raise "Number of Train is not valid" if number !~ NUMBER_FORMAT
    true
  end

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
