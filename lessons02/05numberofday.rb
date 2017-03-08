puts "Введите число"
day = gets.to_i

puts "Введите месяц"
month = gets.to_i

puts "Введите год"
year = gets.to_i

months = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if (year % 4 == 0 && year % 100 != 0) || (year % 100 == 0 && year % 400 == 0)
  months[1] = 29
end

number_of_day = day
i = 0
while i < month - 1 do
  number_of_day += months[i]
  i += 1
end

puts "Номер дня в году #{number_of_day}"
