class Route
  attr_accessor :route, :r1, :r2
  def initialize(from, to)
    @r1 = from
    @r2 = to
    @route = []
    @route << from.name
    @route << to.name
  end

  def addtransit(transit)
    @route.insert(-2, transit.name)
  end

  def deltransit(transit)
    @transit.delete(transit.name)
  end

  def view
    puts @route.join(' >>> ')
  end
end