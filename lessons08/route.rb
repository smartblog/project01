class Route
  attr_accessor :stations
  def initialize(from, to)
    @stations = [from, to]
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def validate!
    raise 'Object in route is not Station' unless @stations.all? { |object| object.is_a?(Station) }
    true
  end
end
