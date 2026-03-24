# Day 2 – Ruby Blocks, Proc, Lambda, Closures & Delayed Execution

This document summarizes everything learned on **Day 2** of the Ruby deep-dive journey.

Topics covered:

* Blocks
* `yield`
* `block_given?`
* Proc
* Lambda
* Closures
* `&block`
* Block ↔ Proc conversion
* Lazy / delayed execution
* Block variable scoping
* Variable shadowing

---

# 1. Ruby Blocks

A **block** is a piece of code that can be passed to a method.

Blocks are **not objects** by default but are treated as anonymous functions.

Example:

```ruby
[1,2,3].each do |n|
  puts n * 2
end
```

Output

```
2
4
6
```

Here the block is:

```
do |n|
  puts n * 2
end
```

---

# 2. Creating a Method That Accepts a Block

Blocks can be executed using **yield**.

Example:

```ruby
def my_each(array)
  array.each do |element|
    yield(element)
  end
end

my_each([1,2,3]) do |num|
  puts num * 2
end
```

Output

```
2
4
6
```

### Execution Flow

```
my_each called
     ↓
array.each iteration
     ↓
yield(element)
     ↓
block executes
```

---

# 3. Checking if a Block Exists

Calling `yield` without a block raises an error.

To prevent that we use:

```
block_given?
```

Example:

```ruby
def greet
  if block_given?
    yield
  else
    puts "No Block Given"
  end
end

greet { puts "Hello!" }
greet
```

Output

```
Hello!
No Block Given
```

---

# 4. Repeating a Block

Example:

```ruby
def repeat(n)
  n.times { yield }
end

repeat(3) { puts "Hello!" }
```

Output

```
Hello!
Hello!
Hello!
```

This demonstrates **control flow injection via blocks**.

---

# 5. Proc Objects

A **Proc** is an object that wraps a block of code.

Blocks become objects when converted into Procs.

Example:

```ruby
add = Proc.new { |x,y| x + y }

add.call(2,3)
```

Output

```
5
```

---

# 6. Passing Procs to Methods

Example:

```ruby
def run_operation(a,b,operation)
  operation.call(a,b)
end

add = Proc.new{ |x,y| x+y }

puts run_operation(5,3,add)
```

Output

```
8
```

### Insight

This demonstrates **functions as first-class objects**.

---

# 7. Filtering Using Proc

Example:

```ruby
def filter(array, condition)
  array.select { |element| condition.call(element) }
end

numbers = [1,2,3,4,5]

even_condition = Proc.new { |x| x.even? }

puts filter(numbers, even_condition).inspect
```

Output

```
[2,4]
```

This pattern is common in **functional programming**.

---

# 8. Proc Pipeline

Example:

```ruby
def pipeline(value, operations)
  prev = value
  result = nil

  operations.each do |operation|
    result = operation.call(prev)
    prev = result
  end

  result
end

double = Proc.new { |x| x * 2 }
square = Proc.new { |x| x * x }

puts pipeline(3, [double, square])
```

Output

```
36
```

Flow:

```
3 → double → 6 → square → 36
```

This demonstrates **function composition**.

---

# 9. Lambdas

A **Lambda** is a special type of Proc with stricter behavior.

Syntax:

```
-> { }
lambda { }
```

Example:

```ruby
def make_multiplier(multiplier)
  lambda { |x| x * multiplier }
end

double = make_multiplier(2)

puts double.call(5)
```

Output

```
10
```

---

# 10. Lambda Validators

Example:

```ruby
positive = -> (n) { n > 0 }
even = -> (n) { n.even? }

def validate(number, validators)
  validators.all? { |validator| validator.call(number) }
end

puts validate(4, [positive, even])
```

Output

```
true
```

This pattern is common in **validation pipelines**.

---

# 11. Closures

A **closure** is a function that remembers variables from its surrounding scope.

Example:

```ruby
def make_counter
  count = 0
  lambda { count += 1 }
end

counter = make_counter

puts counter.call
puts counter.call
puts counter.call
```

Output

```
1
2
3
```

Here the lambda **remembers `count` even after the method returns**.

---

# 12. Encapsulation Using Closures

Example:

```ruby
def bank_account(initial_balance)
  balance = initial_balance

  {
    deposit: -> (amount) { balance += amount },
    withdraw: -> (amount) { balance -= amount },
    balance: -> { balance }
  }
end

account = bank_account(100)

account[:deposit].call(50)
account[:withdraw].call(30)

puts account[:balance].call
```

Output

```
120
```

The variable `balance` is **private and protected inside the closure**.

---

# 13. Custom `map` Implementation

Example:

```ruby
def my_map(array)
  result = []
  array.each { |element| result << yield(element) }
  result
end

puts my_map([1,2,3]) { |num| num * 10 }.inspect
```

Output

```
[10,20,30]
```

This mimics **Enumerable#map**.

---

# 14. Understanding `&block`

When a method parameter uses `&block`, Ruby converts the block into a **Proc object**.

Example:

```ruby
def wrapper(&block)
  puts "Before"
  block.call
  puts "After"
end

wrapper { puts "Hello" }
```

Output

```
Before
Hello
After
```

Rule:

```
& converts block ↔ Proc
```

---

# 15. Delayed Execution (Lazy Evaluation)

Example:

```ruby
def delay(seconds, &block)
  -> do
    sleep(seconds)
    block.call
  end
end

task = delay(2) { puts "Hello after delay" }

task.call
```

Execution Flow:

```
delay called
↓
lambda created
↓
task.call
↓
sleep
↓
block executed
```

This pattern is used in **task schedulers and background jobs**.

---

# 16. Block Scope and Closures

Example:

```ruby
def execute_twice
  yield
  yield
end

x = 10

execute_twice do
  x += 1
  puts x
end
```

Output

```
11
12
```

The block modifies the **same captured variable `x`**.

---

# 17. Block Variable Shadowing

Example:

```ruby
x = 10

3.times do |x|
  puts x
end

puts x
```

Output

```
0
1
2
10
```

Reason:

The block parameter `|x|` creates a **new variable that shadows the outer variable**.

---

# 18. Blocks vs Methods Scope

Blocks share outer variables:

```ruby
x = 10

[1].each do
  x = 20
end

puts x
```

Output

```
20
```

Methods do not share outer variables:

```ruby
def change
  x = 20
end

x = 10
change

puts x
```

Output

```
10
```

---

# 19. Key Takeaways

Blocks are anonymous functions passed to methods.

`yield` executes the block.

`block_given?` checks block presence.

Procs allow blocks to become objects.

Lambdas are strict Procs.

Closures allow functions to remember outer variables.

`&block` converts blocks to Proc objects.

Closures enable state persistence.

Block parameters create **new local variables** and can shadow outer variables.

Blocks are widely used in:

* Rails DSLs
* Callbacks
* Iterators
* Transactions
* Resource management

---

# 20. Real-World Usage

Examples in Ruby/Rails:

File handling

```ruby
File.open("test.txt") do |file|
  file.write("Hello")
end
```

Transactions

```ruby
ActiveRecord::Base.transaction do
  user.save!
end
```

Benchmarking

```ruby
Benchmark.measure do
  heavy_task
end
```

All use the **before → yield → after pattern**.

---

# End of Day 2
