require_relative 'manufacturer'

class Carriage
  include Manufacturer
end

class CargoCarriage < Carriage
  def initialize(amount)
    @amount = amount
    @busy_amount = 0
  end

  def carriage_type
    'cargo'
  end

  def fill(volume)
    raise 'Not enough free amount' if @busy_amount + volume > @amount
    @busy_amount += volume
  end

  attr_reader :busy_amount

  def free_amount
    @amount - @busy_amount
  end
end

class PassengerCarriage < Carriage
  attr_accessor :places

  def initialize(places)
    @places = places
    @busy_places = 0
  end

  def carriage_type
    'passenger'
  end

  def take_place
    raise 'Not enough free places' if @busy_places + 1 > @places
    @busy_places += 1
  end

  attr_reader :busy_places

  def free_places
    @places - @busy_places
  end
end
