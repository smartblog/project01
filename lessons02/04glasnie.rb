glasnie = [ "a", "e", "i", "o", "u", "y" ]
my_hash = {}

number = 1
('a' .. 'z').each do |letter|
  if glasnie.include?(letter)
    my_hash[letter] = number
  end
  number += 1
end

puts my_hash
