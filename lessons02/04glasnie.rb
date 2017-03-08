glasnie = [ "a", "e", "i", "o", "u", "y" ]
my_hash = {}

('a' .. 'z').each_with_index{|key, value| my_hash[key] = value + 1 if glasnie.include?(key)}

puts my_hash
