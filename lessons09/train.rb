require_relative 'manufacturer'
require_relative 'instancecounter'
require_relative 'validation'

class Train
  attr_reader :number, :type, :carriages, :speed

  include Manufacturer
  include InstanceCounter::InstanceMethods
  extend InstanceCounter::ClassMethods
  include Validation::InstanceMethods
  extend Validation::ClassMethods

  NUMBER_FORMAT = /^[0-9a-z]{3}-?[0-9a-z]{2}/i
  @@all_trains = {}

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    @speed = 0
    @number = number
    validate!
    @carriages = []
    @@all_trains[number] = self
    register_instance
  end

  def go
    @speed = 50
  end

  def stop
    @speed = 0
  end

  def add_carriages(carriage)
    raise 'Train unsupport this carriage type' if carriage.carriage_type != train_type
    @carriages << carriage if @speed.zero? && carriage.carriage_type == train_type
  end

  def addroute(train_route)
    @index = 0
    @current_route = train_route
    current_station
  end

  def transfer
    if @index < @current_route.stations.count - 1
      @index += 1
      previos_station.departure(self)
      current_station.arrive(self)
    else
      false
    end
  end

  def back_transfer
    if @index > 0
      current_station.departure(self)
      previos_station.arrive(self)
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

  def all_carriages
    @carriages.each_with_index { |carriage, index| yield(carriage, index) }
  end
end

class PassengerTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def train_type
    'passenger'
  end
end

class CargoTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def train_type
    'cargo'
  end
end
