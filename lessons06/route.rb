class Route
  attr_accessor :route
  def initialize(from, to)
    @route = [from, to]
  end

  def add_station(station)
    @route.insert(-2, station)
  end

  def delete_station(station)
    @transit.delete(station)
  end
end