numbers = [10,20,30,40,50]

# print first element
puts "First element:"
puts "Using Index: #{numbers[0]}"
puts "Using .first method: #{numbers.first}"
# print last element
puts "Last element:"
puts "Using Index: #{numbers[-1]}"
puts "Using .last method: #{numbers.last}"
# add 60 to array
numbers << 60
puts "After adding 60: #{numbers.inspect}"
# remove 20
numbers.delete(20)
puts "After removing 20: #{numbers.inspect}" 
# print array length
puts "Array length: #{numbers.length}"



arr = [1,2,3]

arr << 4
arr.push(5)

puts "[1,2,3,4,5]"
puts arr.inspect