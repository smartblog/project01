require_relative 'application'

menu = Application.new

loop do
  puts "------------------"
  puts "Railway Main Menu:"
  puts "------------------"
  puts "1 - New Station"
  puts "2 - New Train"
  puts "3 - Create Route"
  puts "4 - Attach Route to Train"
  puts "5 - Add carriage to Train"
  puts "6 - Delete carriage from Train"
  puts "7 - Transfer Train"
  puts "8 - List of Stations"
  puts "9 - List Trains on Station"
  puts "0 - Exit"
  number = gets.chomp.to_i
  break if number == 0
  case number
  when 1
    menu.create_station
  when 2
    menu.create_train
  when 3
    menu.create_route
  when 4
    menu.attach_route
  when 5

  when 6

  when 7

  when 8
    menu.list_stations
  when 9

  when 10

  end
end