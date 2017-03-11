class Train
  attr_accessor :number, :type, :carriages, :route, :prev_st, :current_st, :next_st
  def initialize(number, type, carriages)
    @train = {}
    @route = {}
    @speed = 0
    @number = number
    @type = type
    @carriages = carriages
    @train[number] = {type: type, carriages: carriages}
  end

  def view
    puts @train
  end

  def current_s
    puts @speed
  end

  def current_c
    puts @carriages
  end

  def go
    @speed = 50
  end

  def stop
    @speed = 0
  end

  def add_c
    @carriages += 1 if @speed == 0
  end

  def addroute(trainroute)
    @station_from = trainroute.r1
    @route = trainroute.route
    @@count = 1
    @current_st = @route[0]
  end

  def transfer
    puts "Train follow Route: #{@route}"
    @prev_st = @route[@@count-1]
    @current_st = @route[@@count]
    @next_st = @route[@@count+1]
    sleep 1
    @station_from.departure(@number)
    puts "Transfer 0#{@@count}: Prev_st: #{@prev_st}, Curr_st: #{@current_st}, Next_st: #{@next_st}"
    @@count += 1
    if @@count == @route.count
      @@count = 1
      @route = []
      @next_st = nil
    end
  end

  def current_station
    puts "Current station #{@current_st}"
  end

  def next_station
    puts "Next station #{@next_st}"
  end

  def previos_station
    puts "Previos station #{@prev_st}"
  end
end