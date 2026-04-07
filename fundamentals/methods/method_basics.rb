def greet
  puts "Hello Harshath"
end

greet


# Output:
# Hello Harshath

# Method With Arguments
def greet(name)
  puts "Hello #{name}"
end

greet("Harshath")
# Output:
# Hello Harshath


# Return Value
# In Ruby, the last evaluated expression in a method is automatically returned. You can also use the `return` keyword to explicitly return a value.
def add(a, b)
  a + b
end

puts add(2, 3)
# Output:
# 5

# Method with Default Arguments
def greet(name = "Guest")
  puts "Hello #{name}"
end
greet
greet("Harshath")
# Output:
# Hello Guest
# Hello Harshath

# Multiple Arguments
def full_name(first, last)
  "#{first} #{last}"
end

puts full_name("Harshath", "S M")
# Output:
# Harshath S M


# Keyword Arguments
def create_user(name:, age:)
  "Name: #{name}, Age: #{age}"
end

puts create_user(name: "Harshath", age: 25)
# Output:
# Name: Harshath, Age: 25

# Default Keyword Arguments
def create_user(name: "Guest", age: 0)
  "Name: #{name}, Age: #{age}"
end
puts create_user
puts create_user(name: "Harshath", age: 25)
# Output:
# Name: Guest, Age: 0
# Name: Harshath, Age: 25


# Splat Args
def sum(*numbers)
  numbers.sum
end
puts sum(1, 2, 3, 4)
# Output:
# 10

# Double splat for keyword arguments
def print_info(**info)
  info.each do |key, value|
    puts "#{key}: #{value}"
  end
end

print_info(name: "Harshath", age: 25, city: "Bangalore")
# Output:
# name: Harshath
# age: 25
# city: Bangalore


# Block
def greet_with_block
  yield if block_given?
end
greet_with_block do
  puts "Welcome to Ruby programming! Harshath"
end

# Output:
# Welcome to Ruby programming! Harshath

# Block with arguments
def greet
  yield("Harshath")
end

greet { |name| puts "Hello #{name}" }

# Procs:
square = Proc.new { |n| n * n }

puts square.call(5)

def test
  p = Proc.new { return "from proc" }
  p.call
  "after proc"
end

puts test


