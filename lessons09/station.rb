require_relative 'instancecounter'
require_relative 'validation'

class Station
  attr_accessor :name
  attr_reader :trains

  include Validation::InstanceMethods
  extend Validation::ClassMethods

  @@all_stations = []
  NAME_FORMAT = /[a-z]{2,}-*[a-z]{2,}*\d{2}/i

  validate :name, :presence
  validate :name, :format, NAME_FORMAT

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
    @trains.select { |object| object.type == traintype }
  end

  def self.all
    @@all_stations
  end

  def all_trains
    @trains.each { |train| yield(train) }
  end
end
