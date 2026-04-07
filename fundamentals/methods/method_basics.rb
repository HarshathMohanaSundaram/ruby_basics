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


