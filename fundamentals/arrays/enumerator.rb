# enumerator.rb
# Demonstrates how Ruby Enumerators work internally

# Basic Enumerator from Array
numbers = [1, 2, 3]

enum = numbers.each

puts "Class of enum:"
p enum.class

puts "\nIterating using next:"
p enum.next
p enum.next
p enum.next

# Uncomment to see StopIteration
# p enum.next

# Reset Enumerator
enum = numbers.each

puts "\nUsing peek:"
p enum.peek
p enum.peek
p enum.next
p enum.peek

# Enumerator without block
def custom_each(array)
  return to_enum(:custom_each, array) unless block_given?

  for element in array
    yield element
  end
end

enum = custom_each([10, 20, 30])

puts "\nCustom Enumerator:"
p enum.class

puts "Values from custom enumerator:"
p enum.next
p enum.next

# Enumerator with each_with_index
puts "\nEnumerator with index:"
numbers.each_with_index do |num, index|
  puts "Index: #{index}, Value: #{num}"
end

# Manual Enumerator
puts "\nManual Enumerator example:"
manual_enum = Enumerator.new do |yielder|
  yielder << 1
  yielder << 2
  yielder << 3
end

p manual_enum.next
p manual_enum.next
p manual_enum.next