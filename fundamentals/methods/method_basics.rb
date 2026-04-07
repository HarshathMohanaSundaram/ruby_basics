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