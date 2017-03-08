fibo_array = [0, 1]

number = fibo_array[-1] + fibo_array[-2]

while number < 100 do
  fibo_array << number
  number = fibo_array[-1] + fibo_array[-2]
end

puts fibo_array
