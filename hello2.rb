puts "What is your name?"
name = gets.chomp

puts "What is your birthday year?"
year = gets.chomp.to_i

puts "#{name}, hello! Your ages like #{2017 - year}"
