require_relative 'manufacturer'

class Carriage
  include Manufacturer
end

class CargoCarriage < Carriage
  def carriage_type
    "cargo"
  end
end

class PassengerCarriage < Carriage
  def carriage_type
    "passenger"
  end
end