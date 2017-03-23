require_relative 'instancecounter'

class Station
  attr_accessor :name
  attr_reader :trains

  @@all_stations = []
  NAME_FORMAT = /[a-z]{2,}-*[a-z]{2,}*\d{2}/i

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all_stations << self
  end

  def arrive(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end

  def filter(traintype)
    @trains.select {|object| object.type == traintype}
  end

  def self.all
    @@all_stations
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Name of Station is't valid" if name !~ NAME_FORMAT
    true
  end
end