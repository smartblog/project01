puts "Введите коэффициент a"
a = gets.to_i

puts "Введите коэффициент b"
b = gets.to_i

puts "Введите коэффициент c"
c = gets.to_i

d = b ** 2 - 4 * a * c

if d > 0
  x1 = ( -b + Math.sqrt(d) ) / (2 * a)
  x2 = ( -b - Math.sqrt(d) ) / (2 * a)
  puts "Дискриминант = #{d}, корни = #{x1} и #{x2}"
elsif d = 0
  x1 = ( -b + Math.sqrt(d) ) / (2 * a)
  puts "Дискриминант = #{d}, корни = #{x1}"
elsif d < 0
  puts "Дискриминант = #{d}, корней нет"
end