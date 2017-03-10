class Station
  def initialize(name)
    @name = name
    @files = {}
  end
end

class Route

end

class Train
@@trains = {}

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
    @@trains[number] = type
  end

  def current_speed
    puts @speed
  end

  def current_carriages
    puts @carriages
  end

  def go
    @speed = 50
  end

  def stop
    @speed = 0
  end

  def edit_c(action)
    if @speed == 0
      if action == "add"
        @carriages += 1
      elsif action == "del"
        @carriages -= 1
      end
    else
      puts "You need stop train before add or del carriages"
    end
  end

  def view
    puts "Train: #{@number}, type: #{@type}, carriages: #{@carriages}, current speed: #{@speed}"
  end

  def Train.get_trains
    puts "List of all Trains: \n"
    @@trains.each {|key, value| puts "Train: #{key}, type: #{value}"}
  end
end

train01 = Train.new("ALM003", "passenger", 12)
train02 = Train.new("AST003", "cargo", 15)

Train.get_trains

train01.go
train01.view
train02.view

train01.edit_c("add")
train01.view

train01.stop
train01.edit_c("del")
train01.view

train02.edit_c("add")
train02.view

train01.current_carriages
train02.current_carriages

