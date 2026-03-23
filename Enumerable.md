# Ruby Enumerators – Detailed Guide

## Overview

This document explains **Ruby Enumerators** in detail. Enumerators allow **external iteration**, meaning the developer controls how and when iteration happens.

They are commonly used when:

* No block is provided to an iterator method
* Lazy data processing is required
* Building data pipelines
* Processing large datasets efficiently

Understanding enumerators is important because many Ruby and Rails APIs rely on them.

---

# 1. What is an Enumerator?

An **Enumerator** is an object that allows manual control over iteration.

Normally, Ruby uses **internal iteration**, where Ruby manages the loop execution.

Example of internal iteration:

```ruby
[1,2,3].each do |n|
  puts n
end
```

Here Ruby controls the iteration.

When no block is given, Ruby returns an **Enumerator** instead.

Example:

```ruby
enum = [1,2,3].each
```

Output:

```
#<Enumerator: [1, 2, 3]:each>
```

Now iteration can be controlled manually.

---

# 2. Using `next`

The `next` method returns the next element in the sequence.

Example:

```ruby
enum = [1,2,3].each

puts enum.next
puts enum.next
puts enum.next
```

Output:

```
1
2
3
```

If called again:

```ruby
enum.next
```

Output:

```
StopIteration
```

This happens because the iterator reached the end.

---

# 3. Internal vs External Iteration

### Internal Iteration

Ruby manages the loop.

```ruby
[1,2,3].each do |n|
  puts n
end
```

---

### External Iteration

The developer manages iteration.

```ruby
enum = [1,2,3].each

loop do
  puts enum.next
end
```

Here the developer controls when the next value is fetched.

---

# 4. Using `peek`

`peek` allows looking at the next value **without advancing the iterator**.

Example:

```ruby
enum = [10,20,30].each

puts enum.next
puts enum.next
puts enum.peek
puts enum.next
```

Step-by-step behavior:

1. `next` returns **10** and moves pointer
2. `next` returns **20** and moves pointer
3. `peek` returns **30** but does NOT move pointer
4. `next` returns **30**

Output:

```
10
20
30
30
```

Key idea:

| Method | Behavior                             |
| ------ | ------------------------------------ |
| `next` | Returns value and moves pointer      |
| `peek` | Returns value without moving pointer |

---

# 5. Enumerator State (Pointer Concept)

Enumerators maintain an internal **cursor/pointer**.

Example:

```ruby
enum = [10,20,30].each
```

Initial state:

```
Pointer → before 10
```

After calling `next`:

```
Pointer → before 20
```

After calling `next` again:

```
Pointer → before 30
```

This pointer is what allows manual iteration.

---

# 6. Creating Enumerators Manually

Ruby allows creating custom enumerators.

Example:

```ruby
enum = Enumerator.new do |yielder|
  yielder << 10
  yielder << 20
  yielder << 30
end
```

Iterating:

```ruby
enum.each do |n|
  puts n
end
```

Output:

```
10
20
30
```

The `yielder` object is used to push values into the enumerator.

---

# 7. Infinite Enumerators

Enumerators can generate infinite sequences.

Example:

```ruby
numbers = Enumerator.new do |y|
  i = 1
  loop do
    y << i
    i += 1
  end
end
```

Usage:

```ruby
puts numbers.next
puts numbers.next
puts numbers.next
```

Output:

```
1
2
3
```

This technique is used for **lazy data streams**.

---

# 8. Using Enumerator with Custom Classes

Enumerators are often used when implementing custom iterators.

Example:

```ruby
class MyArray
  def initialize(arr)
    @arr = arr
  end

  def each
    return enum_for(:each) unless block_given?

    i = 0
    while i < @arr.length
      yield @arr[i]
      i += 1
    end
  end
end
```

Usage with block:

```ruby
numbers = MyArray.new([1,2,3])

numbers.each { |n| puts n }
```

Usage without block:

```ruby
enum = numbers.each

puts enum.next
puts enum.next
```

---

# 9. Why Enumerators Are Powerful

Enumerators enable several advanced patterns.

### Lazy Processing

```ruby
(1..1_000_000).lazy.map { |n| n * 2 }
```

Only calculates values when needed.

---

### Method Chaining

```ruby
[1,2,3].each.with_index
```

Result:

```
[[1,0],[2,1],[3,2]]
```

---

### Data Pipelines

```ruby
(1..10)
  .map { |n| n * 2 }
  .select { |n| n > 10 }
```

Enumerators make these transformations efficient.

---

# 10. Real Rails Example

Rails uses enumerators to process large datasets efficiently.

Example:

```ruby
User.find_each
```

If no block is provided:

```ruby
enum = User.find_each
```

Now you can chain operations:

```ruby
enum.with_index
enum.lazy.map { |u| u.email }
```

This prevents loading millions of records into memory at once.

---

# Key Takeaways

* Enumerators allow **external iteration**.
* They maintain an internal **pointer/cursor**.
* `next` moves the pointer forward.
* `peek` reads the next value without moving the pointer.
* Enumerators can generate **finite or infinite sequences**.
* Rails uses enumerators for **efficient batch processing**.

---

# Practice Exercise

Predict the output:

```ruby
enum = [5,10,15].each

puts enum.next
puts enum.peek
puts enum.next
puts enum.next
```

Try running this code and observe how the enumerator pointer moves.
