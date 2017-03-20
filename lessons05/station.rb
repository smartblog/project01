require_relative 'instancecounter'

class Station
  attr_accessor :name

  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
  end

  def arrive(train)
    @trains << train
  end

  def list
    puts "All trains on station: #{@name}"
    @trains.each {|object| puts "Train: #{object.number}"}
  end

  def filter(traintype)
    puts "All #{traintype} trains on station: #{@name}"
    @filter_trains = @trains.select {|object| object.type == traintype}
  end

  def departure(train)
    puts "Departure train #{train.number} from Station: #{@name}" if @trains.delete(train)
  end

  def self.all
    @@all_stations
  end
end