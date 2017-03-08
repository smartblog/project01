@pokipki = {}
@totalsum = 0

loop do
  puts "Enter name of product, or 'stop' if you want exit"
  product = gets.chomp
  break if product == "stop"

  puts "Enter price of product"
  price = gets.to_f

  puts "Enter amount of product"
  amount = gets.to_f

  total = price * amount

  if @pokupki.nil?
    @pokupki = {product=>{:price=>price, :amount=>amount, :total=>total}}
  else
    @pokupki[product] = {:price=>price, :amount=>amount, :total=>total}
  end

end

@pokupki.each do |product, desc|
  puts "Product name: #{product}, Price: #{desc[:price]}, Amount: #{desc[:amount]}, Total: #{desc[:total]}"
  @totalsum += desc[:total]
end
puts "Total Sum: #{@totalsum}"
