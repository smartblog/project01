class Route
  attr_accessor :route
  def initialize(from, to)
    @route = [from, to]
    validate!
  end

  def add_station(station)
    @route.insert(-2, station)
  end

  def delete_station(station)
    @transit.delete(station)
  end

  def validate!
    raise "Object in route is not Station" unless @route.all?{|object| object.is_a?(Station)}
    true
  end
end