number = [1,2,3,4,5]

puts "First element:"
puts number[0]

puts "Last element:"
puts number[-1]

puts "number length:"
puts number.length

puts "Append Element:"
number << 6
puts number.inspect


puts "Array Methods: "
puts ".first Method: #{number.first}"
puts ".last Method: #{number.last}"
puts ".size Method: #{number.size}"
puts ".include? Method (3): #{number.include?(3)}"
puts ".include? Method (10): #{number.include?(10)}"
puts ".reverse Method: #{number.reverse}"
puts ".shuffle Method: #{number.shuffle}"