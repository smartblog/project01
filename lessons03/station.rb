class Station
  attr_accessor :name
  def initialize(name)
    @name = name
    @trains = {}
  end

  def arrive(train)
    @trains[train.number] = {type: train.type, carriages: train.carriages}
  end

  def list
    puts "All trains on station: #{@name}"
    @trains.each {|key, value| puts "Train: #{key}, #{value[:type]}, #{value[:carriages]} "}
  end

  def filter(traintype)
    puts "All #{traintype} trains on station: #{@name}"
    @trains.each {|key, value| puts "Train: #{key}, #{value[:type]}, #{value[:carriages]}" if value[:type] == traintype}
  end

  def departure(train)
    @trains.delete(train)
    puts "Departure train #{train} from Station: #{@name}"
  end
end