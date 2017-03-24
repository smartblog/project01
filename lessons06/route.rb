class Route
  attr_accessor :route
  def initialize(from, to)
    @from = from
    @to = to
    validate!
    @route = [@from, @to]
  end

  def add_station(station)
    @route.insert(-2, station)
  end

  def delete_station(station)
    @transit.delete(station)
  end

  def validate!
    raise "From is not Station" if @from.class != Station
    raise "To is not Station" if @to.class != Station
    true
  end
end