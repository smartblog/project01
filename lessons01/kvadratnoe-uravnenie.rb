puts "Введите коэффициент a"
a = gets.to_f

puts "Введите коэффициент b"
b = gets.to_f

puts "Введите коэффициент c"
c = gets.to_f

d = b ** 2 - 4 * a * c

if d > 0
  sqrtd = Math.sqrt(d)
  x1 = ( -b + sqrtd ) / (2 * a)
  x2 = ( -b - sqrtd ) / (2 * a)
  puts "Дискриминант = #{d}, корни = #{x1} и #{x2}"
elsif d == 0
  x1 = -b / (2 * a)
  puts "Дискриминант = #{d}, корни = #{x1}"
elsif d < 0
  puts "Дискриминант = #{d}, корней нет"
end
