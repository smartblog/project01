puts "Первая сторона треугольника"
a = gets.to_f

puts "Вторая сторона треугольника"
b = gets.to_f

puts "Третья сторона треугольника"
c = gets.to_f

array = [a, b, c]
array.sort!

if ( array[2] ** 2 ) == ( array[0] ** 2 + array[1] ** 2 )
  puts "Треугольник прямоугольный"
else
  puts "Треугольник непрямоугольный"
end

if array[0] == array[1] && array[0] == array[2]
  puts "Треугольник равнобедренный и равносторонний"
elsif array[0] == array[1]
  puts "Треугольник равнобедренный"
else
end
