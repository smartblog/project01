fibo_array = [0, 1]

loop do
  number = fibo_array[-1] + fibo_array[-2]
  if number < 100
    fibo_array.push(number)
  else
    break
  end
end

puts fibo_array
