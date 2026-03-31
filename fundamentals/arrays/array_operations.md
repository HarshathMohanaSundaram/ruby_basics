# Ruby Array Operations

This document covers the most commonly used Array operations in Ruby. Arrays are ordered collections that can store objects of any type.

---

# 1. Creating Arrays

```ruby
arr = []
arr = [1,2,3]
arr = Array.new
arr = Array.new(3)
arr = Array.new(3, "ruby")
arr = Array.new(3) { |i| i * 2 }
```

Example:

```ruby
arr = Array.new(3) { |i| i + 1 }
# => [1,2,3]
```

---

# 2. Accessing Elements

```ruby
arr = [10,20,30,40]

arr[0]
arr[1]

arr[-1]
arr[-2]

arr.first
arr.last

arr.fetch(2)
arr.fetch(10, "default")
```

`fetch` raises an error if index does not exist unless a default value is provided.

---

# 3. Adding Elements

```ruby
arr = [1,2,3]

arr << 4
arr.push(5)
arr.unshift(0)

arr.insert(2, 99)
```

Example:

```ruby
arr = [1,2,3]
arr.insert(1,100)

# => [1,100,2,3]
```

---

# 4. Removing Elements

```ruby
arr = [1,2,3,4]

arr.pop
arr.shift

arr.delete(3)
arr.delete_at(1)

arr.clear
```

Example:

```ruby
arr = [1,2,3,4]
arr.delete(2)

# => [1,3,4]
```

---

# 5. Checking Array Properties

```ruby
arr.empty?
arr.length
arr.size
arr.count
```

Example:

```ruby
arr = [1,2,3]

arr.size
# => 3
```

---

# 6. Searching Elements

```ruby
arr.include?(3)

arr.index(2)
arr.rindex(2)

arr.find { |n| n > 2 }
arr.detect { |n| n > 2 }
```

Example:

```ruby
[1,2,3,4].find { |x| x.even? }
# => 2
```

---

# 7. Filtering Elements

```ruby
arr.select { |n| n.even? }

arr.reject { |n| n.odd? }

arr.keep_if { |n| n > 2 }

arr.delete_if { |n| n < 2 }
```

Example:

```ruby
[1,2,3,4].select { |x| x > 2 }
# => [3,4]
```

---

# 8. Transforming Arrays

```ruby
arr.map { |n| n * 2 }
arr.collect { |n| n * 2 }

arr.map! { |n| n * 2 }
```

Example:

```ruby
[1,2,3].map { |x| x * 2 }
# => [2,4,6]
```

---

# 9. Flattening Arrays

```ruby
arr = [[1,2],[3,4]]

arr.flatten
arr.flatten!
```

Example:

```ruby
[[1,2],[3,4]].flatten
# => [1,2,3,4]
```

---

# 10. Combining Arrays

```ruby
[1,2] + [3,4]

[1,2] | [2,3]

[1,2] & [2,3]
```

Example:

```ruby
[1,2] | [2,3]
# => [1,2,3]
```

---

# 11. Removing Duplicates

```ruby
arr.uniq
arr.uniq!
```

Example:

```ruby
[1,1,2,2,3].uniq
# => [1,2,3]
```

---

# 12. Sorting Arrays

```ruby
arr.sort
arr.sort!

arr.sort_by { |x| -x }
```

Example:

```ruby
[3,1,2].sort
# => [1,2,3]
```

---

# 13. Reversing Arrays

```ruby
arr.reverse
arr.reverse!
```

Example:

```ruby
[1,2,3].reverse
# => [3,2,1]
```

---

# 14. Joining Arrays

```ruby
arr.join
arr.join(", ")
```

Example:

```ruby
["Ruby","Rails"].join(" ")
# => "Ruby Rails"
```

---

# 15. Splitting Into Chunks

```ruby
arr.each_slice(2)

arr.each_cons(2)
```

Example:

```ruby
[1,2,3,4].each_slice(2) { |x| p x }

# [1,2]
# [3,4]
```

---

# 16. Iterating Over Arrays

```ruby
arr.each { |n| puts n }

arr.each_with_index { |n,i| puts "#{i}: #{n}" }
```

Example:

```ruby
[10,20,30].each_with_index do |num,index|
  puts "#{index} => #{num}"
end
```

---

# 17. Array Comparison

```ruby
[1,2,3] == [1,2,3]

[1,2,3] <=> [1,2,4]
```

---

# 18. Random Elements

```ruby
arr.sample
arr.sample(2)

arr.shuffle
arr.shuffle!
```

Example:

```ruby
[1,2,3].sample
```

---

# 19. Rotation

```ruby
arr.rotate
arr.rotate(2)

arr.rotate!
```

Example:

```ruby
[1,2,3,4].rotate(1)
# => [2,3,4,1]
```

---

# 20. Taking Elements

```ruby
arr.take(2)

arr.drop(2)
```

Example:

```ruby
[1,2,3,4].take(2)
# => [1,2]
```

---

# 21. Predicate Methods

```ruby
arr.any?
arr.all?
arr.none?
arr.one?
```

Example:

```ruby
[1,2,3].any? { |x| x > 2 }
# => true
```

---

# 22. Mutation vs Non-Mutation

Non-mutating methods return a new array.

```ruby
arr.map { |x| x * 2 }
```

Mutating methods modify the original array.

```ruby
arr.map! { |x| x * 2 }
```

Methods ending with `!` usually mutate the array.

---

# 23. Enumerator Support

When iteration methods are called without blocks they return an Enumerator.

```ruby
arr = [1,2,3]

enum = arr.map

p enum.class
```

---

# 24. Lazy Evaluation with Arrays

Lazy enumerators process elements only when needed.

```ruby
result = (1..Float::INFINITY)
          .lazy
          .map { |n| n * 2 }
          .select { |n| n > 10 }
          .first(3)

p result
```

---

# Summary

Important Array concept groups:

* Creation
* Accessing elements
* Adding and removing elements
* Searching and filtering
* Transformation
* Sorting and combining
* Iteration
* Mutation vs non-mutation
* Enumerators and lazy evaluation
