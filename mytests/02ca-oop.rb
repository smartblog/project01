class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello world!"}

  def initialize(username, password)
    @username = username
    @password = password
  end

  def current_user
    @username
  end

  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
puts "Manufacturer: #{$manufacturer}"
puts "Files: #{Computer.display_files}"
