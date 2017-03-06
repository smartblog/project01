puts "Как Вас зовут?"

name = gets.chomp
name.capitalize!

puts "Какой у Вас рост?"

height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight < 0
  puts "Ваш вес уже идеальный!"
else
  puts "#{name}, Ваш идеальный вес #{ideal_weight} кг"
end
