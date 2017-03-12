class Station
  attr_accessor :name
  def initialize(name)
    @name = name
    @trains = []
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
    puts "Departure train #{train.number} from Station: #{@name}" if @trains.delete(train) == train
  end
end