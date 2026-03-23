# Day 1 – Ruby Iterators, Blocks, and Enumerable

## Overview

Today we explored the foundations of Ruby iteration and collection processing.

Topics covered:

* Ruby Blocks
* `yield`
* `block_given?`
* Custom iterators
* Implementing `map`, `select`, and `reject`
* The `Enumerable` module
* How Ruby builds powerful collection methods using `each`

Understanding these concepts is essential because many Ruby and Rails features rely on them, including:

* Rails routing DSL
* ActiveRecord collections
* RSpec DSL
* Background job configuration
* Enumerable operations on database records

---

# 1. Ruby Blocks

A **block** is an anonymous chunk of code passed to a method.

### Example

```ruby
[1,2,3].each do |number|
  puts number
end
```

Blocks allow methods to execute custom behavior defined by the caller.

### Single Line Block

```ruby
numbers.map { |n| n * 2 }
```

### Multi-line Block

```ruby
numbers.map do |n|
  n * 2
end
```

---

# 2. `yield`

`yield` is used inside a method to execute the block passed to that method.

### Example

```ruby
def greet
  yield("Harshath")
end

greet do |name|
  puts "Hello #{name}"
end
```

Execution Flow

```
method starts
   ↓
yield
   ↓
block executes
   ↓
method continues
```

---

# 3. What Happens if `yield` Has No Block?

Ruby raises an error:

```
LocalJumpError: no block given (yield)
```

Example:

```ruby
def greet
  yield
end

greet
```

---

# 4. `block_given?`

`block_given?` checks whether a block was passed to the method.

### Example

```ruby
def greet
  if block_given?
    yield
  else
    puts "No block provided"
  end
end
```

---

# 5. Building a Custom Iterator

We implemented our own iterator using `yield`.

```ruby
class MyArray
  def initialize(array)
    @array = array
  end

  def each
    i = 0
    while i < @array.length
      yield @array[i]
      i += 1
    end
  end
end
```

Usage:

```ruby
numbers = MyArray.new([1,2,3])

numbers.each do |n|
  puts n
end
```

---

# 6. Implementing Common Collection Methods

## `map`

Transforms each element and returns a new collection.

```ruby
def map
  result = []

  each do |element|
    result << yield(element)
  end

  result
end
```

Example:

```ruby
[1,2,3].map { |n| n * 2 }

# Output
[2,4,6]
```

---

## `select`

Filters elements based on a condition.

```ruby
def select
  result = []

  each do |element|
    result << element if yield(element)
  end

  result
end
```

Example:

```ruby
[1,2,3,4].select { |n| n.even? }

# Output
[2,4]
```

---

## `reject`

Opposite of `select`.

```ruby
def reject
  result = []

  each do |element|
    result << element unless yield(element)
  end

  result
end
```

Example:

```ruby
[1,2,3,4].reject { |n| n.even? }

# Output
[1,3]
```

---

# 7. The Enumerable Module

`Enumerable` is a Ruby module that provides many powerful methods for working with collections.

Important idea:

**Enumerable only requires one method:**

```
each
```

If a class defines `each`, it can include `Enumerable` and gain dozens of collection methods automatically.

Example:

```ruby
class MyArray
  include Enumerable

  def initialize(array)
    @array = array
  end

  def each
    for element in @array
      yield element
    end
  end
end
```

Now we automatically get:

```
map
select
reject
find
reduce
group_by
count
```

---

# 8. How Enumerable Works Internally

Simplified version of `map` inside Enumerable:

```ruby
module Enumerable
  def map
    result = []

    each do |element|
      result << yield(element)
    end

    result
  end
end
```

Notice:

```
map
 ↓
calls each
 ↓
each yields elements
 ↓
block processes elements
```

---

# 9. Important Enumerable Methods

Below are commonly used methods.

---

## Iteration Methods

### `each`

Iterates through each element.

```ruby
[1,2,3].each { |n| puts n }
```

---

### `each_with_index`

Provides both value and index.

```ruby
["a","b","c"].each_with_index do |val, index|
  puts "#{index}: #{val}"
end
```

---

## Transformation Methods

### `map`

Transforms elements.

```ruby
[1,2,3].map { |n| n * 10 }
```

---

### `flat_map`

Maps and flattens the result.

```ruby
[[1,2],[3,4]].flat_map { |x| x }
```

Result:

```
[1,2,3,4]
```

---

## Filtering Methods

### `select`

Returns elements that match a condition.

```ruby
[1,2,3,4].select { |n| n > 2 }
```

---

### `reject`

Opposite of select.

```ruby
[1,2,3].reject { |n| n == 2 }
```

---

### `find` / `detect`

Returns the first element matching a condition.

```ruby
[1,2,3,4].find { |n| n > 2 }
```

Result:

```
3
```

---

# 10. Boolean Query Methods

### `any?`

Returns true if at least one element matches.

```ruby
[1,2,3].any? { |n| n > 2 }
```

---

### `all?`

Returns true if all elements match.

```ruby
[2,4,6].all? { |n| n.even? }
```

---

### `none?`

Returns true if no elements match.

```ruby
[1,3,5].none? { |n| n.even? }
```

---

# 11. Aggregation Methods

### `count`

Counts elements.

```ruby
[1,2,3].count
```

---

### `reduce` / `inject`

Accumulates values.

```ruby
[1,2,3,4].reduce(0) { |sum, n| sum + n }

# Result
10
```

---

# 12. Grouping Methods

### `group_by`

Groups elements based on a block.

```ruby
[1,2,3,4,5].group_by { |n| n.even? }
```

Result:

```
{
  true => [2,4],
  false => [1,3,5]
}
```

---

# 13. Why Enumerable Is Important in Rails

Rails uses Enumerable in many places.

Examples:

### ActiveRecord Relations

```ruby
users = User.where(active: true)

users.map(&:email)
users.select(&:admin?)
```

### Collections in Views

```ruby
@posts.each do |post|
  render post
end
```

### Background jobs and batch processing

Enumerable methods allow clean data transformations.

---

# Key Takeaways

* Blocks allow methods to execute caller-defined behavior.
* `yield` executes a passed block.
* `block_given?` prevents errors when blocks are missing.
* Iterators can be implemented using `yield`.
* The `Enumerable` module provides powerful collection utilities.
* Implementing `each` unlocks dozens of built-in methods.

---

# Next Topic (Day 2)

Tomorrow we will explore:

```
Block vs Proc vs Lambda
```

And learn:

* How Ruby converts blocks into objects
* The `&block` operator
* How Rails DSLs like routes and RSpec are implemented
* Advanced Ruby metaprogramming concepts
