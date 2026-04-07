# Ruby Methods — Documentation & Examples

This document summarizes all Ruby method examples and explanations from the `fundamentals/methods/` directory. It covers basic method definitions, arguments, return values, splat and keyword arguments, blocks, procs, and lambdas.

---

## method_basics.rb

### Simple Method
```ruby
def greet
  puts "Hello Harshath"
end

greet
```
**Output:**
Hello Harshath

---

### Method With Arguments
```ruby
def greet(name)
  puts "Hello #{name}"
end

greet("Harshath")
```
**Output:**
Hello Harshath

---

### Return Value
```ruby
def add(a, b)
  a + b
end

puts add(2, 3)
```
**Output:**
5

---

### Method with Default Arguments
```ruby
def greet(name = "Guest")
  puts "Hello #{name}"
end
greet
greet("Harshath")
```
**Output:**
Hello Guest
Hello Harshath

---

### Multiple Arguments
```ruby
def full_name(first, last)
  "#{first} #{last}"
end

puts full_name("Harshath", "S M")
```
**Output:**
Harshath S M

---

### Keyword Arguments
```ruby
def create_user(name:, age:)
  "Name: #{name}, Age: #{age}"
end

puts create_user(name: "Harshath", age: 25)
```
**Output:**
Name: Harshath, Age: 25

---

### Default Keyword Arguments
```ruby
def create_user(name: "Guest", age: 0)
  "Name: #{name}, Age: #{age}"
end
puts create_user
puts create_user(name: "Harshath", age: 25)
```
**Output:**
Name: Guest, Age: 0
Name: Harshath, Age: 25

---

### Splat Args
```ruby
def sum(*numbers)
  numbers.sum
end
puts sum(1, 2, 3, 4)
```
**Output:**
10

---

### Double splat for keyword arguments
```ruby
def print_info(**info)
  info.each do |key, value|
    puts "#{key}: #{value}"
  end
end

print_info(name: "Harshath", age: 25, city: "Bangalore")
```
**Output:**
name: Harshath
age: 25
city: Bangalore

---

### Block
```ruby
def greet_with_block
  yield if block_given?
end
greet_with_block do
  puts "Welcome to Ruby programming! Harshath"
end
```
**Output:**
Welcome to Ruby programming! Harshath

---

### Block with arguments
```ruby
def greet
  yield("Harshath")
end

greet { |name| puts "Hello #{name}" }
```
**Output:**
Hello Harshath

---

### Procs
```ruby
square = Proc.new { |n| n * n }
puts square.call(5)
```
**Output:**
25

---

### Proc return behavior
```ruby
def test
  p = Proc.new { return "from proc" }
  p.call
  "after proc"
end

puts test
```
**Output:**
from proc

---

### Lambdas
```ruby
square_lambda = ->(n) { n * n }
puts square_lambda.call(5)
```
**Output:**
25

---

### Lambda return behavior
```ruby
def test_lambda
  l = -> { return "from lambda" }
  l.call
  "after lambda"
end

puts test_lambda
```
**Output:**
after lambda

---

## practice_exercise.rb

### Sum of Numbers
```ruby
def sum(*numbers)
  numbers.sum
end
puts sum(1, 2, 3) # Output: 6
```
**Output:**
6

---

### Default Arguments
```ruby
def greet(name = "Guest")
  "Hello #{name}"
end
puts greet
puts greet("Harshath")
```
**Output:**
Hello Guest
Hello Harshath

---

### Splat Method (Find Max)
```ruby
def max_numbers(*numbers)
  numbers.max
end
puts max_numbers(1, 5, 3, 9, 2) # Output: 9
```
**Output:**
9

---

### Keyword Arguments
```ruby
def create_user(name:, age:)
  "Name: #{name}, Age: #{age}"
end
puts create_user(name: "Harshath", age: 25)
```
**Output:**
Name: Harshath, Age: 25

---

### Block Method
```ruby
def repeat(times)
  times.times { yield }
end

repeat(3) { puts "Hello!" }
```
**Output:**
Hello!
Hello!
Hello!
