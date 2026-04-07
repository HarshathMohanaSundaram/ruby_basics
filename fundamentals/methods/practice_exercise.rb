# Sum of Numbers
def sum(*numbers)
  numbers.sum
end
puts sum(1, 2, 3) # Output: 6

puts "\n--- Default Arguments ---"
# Default Arguments
def greet(name = "Guest")
  "Hello #{name}"
end
puts greet
puts greet("Harshath")
# Output:
# Hello Guest
# Hello Harshath


# splat method
# find the max number from a list of numbers
def max_numbers(*numbers)
  numbers.max
end
puts max_numbers(1, 5, 3, 9, 2) # Output: 9

# Keyword Arguments
def create_user(name:, age:)
  "Name: #{name}, Age: #{age}"
end
puts create_user(name: "Harshath", age: 25)
# Output:
# Name: Harshath, Age: 25

# Block Method
def repeat(times)
  times.times { yield }
end

repeat(3) { puts "Hello!" }
# Output:
# Hello!
# Hello!
# Hello!
