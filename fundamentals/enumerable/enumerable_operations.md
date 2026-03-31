# Ruby Enumerable Operations

This document covers the most commonly used Enumerable methods in Ruby. The `Enumerable` module is mixed into `Array`, `Hash`, `Range`, and other collection classes, providing a rich set of iteration and querying methods.

---

# 1. map (collect) — Transform Every Element

Returns a new array with each element transformed by the block.

```ruby
[1, 2, 3, 4].map { |n| n * 2 }
# => [2, 4, 6, 8]
```

`map` does not modify the original collection. Use `map!` on arrays to mutate in place.

---

# 2. select (filter) — Keep Matching Elements

Returns a new array containing only elements for which the block returns `true`.

```ruby
[1, 2, 3, 4, 5, 6].select { |n| n.even? }
# => [2, 4, 6]
```

---

# 3. reject — Remove Matching Elements

The opposite of `select` — returns elements for which the block returns `false`.

```ruby
[1, 2, 3, 4, 5, 6].reject { |n| n.even? }
# => [1, 3, 5]
```

---

# 4. find (detect) — First Matching Element

Returns the **first** element for which the block returns `true`, or `nil` if none match.

```ruby
[3, 7, 10, 20].find { |n| n > 5 }
# => 7
```

Unlike `select`, `find` stops as soon as it finds the first match.

---

# 5. reduce (inject) — Accumulate into a Single Value

Combines all elements into a single value using an accumulator.

```ruby
[1, 2, 3, 4].reduce(0) { |sum, n| sum + n }
# => 10
```

The first argument (`0`) is the initial value of the accumulator. The block receives the accumulator and the current element.

**Shorthand with symbols:**

```ruby
[1, 2, 3, 4].reduce(:+)  # => 10  (sum)
[1, 2, 3, 4].reduce(:*)  # => 24  (product)
```

---

# 6. group_by — Group Elements into a Hash

Returns a hash where keys are the block's return values and values are arrays of elements that produced each key.

```ruby
[1, 2, 3, 4, 5, 6].group_by { |n| n.even? }
# => {false=>[1, 3, 5], true=>[2, 4, 6]}

["apple", "bat", "ball", "cat"].group_by { |w| w.length }
# => {5=>["apple"], 3=>["bat", "ball", "cat"]}
```

---

# 7. each_with_object — Build a Collection While Iterating

Passes an accumulator object to each iteration and returns it at the end. Unlike `reduce`, the accumulator is the **second** block parameter.

```ruby
[1, 2, 3].each_with_object({}) do |n, hash|
  hash[n] = n * n
end
# => {1=>1, 2=>4, 3=>9}
```

Useful for building hashes or arrays without needing to return the accumulator explicitly (as required by `reduce`).

---

# 8. Enumerable on Hashes

`Enumerable` methods work on hashes too — each iteration yields a key-value pair.

```ruby
scores = { math: 90, science: 40, english: 80 }

scores.select { |k, v| v > 50 }
# => {:math=>90, :english=>80}

scores.reject { |k, v| v > 50 }
# => {:science=>40}

scores.map { |k, v| [k, v * 2] }.to_h
# => {:math=>180, :science=>80, :english=>160}
```

---

# 9. Other Useful Enumerable Methods

```ruby
arr = [1, 2, 3, 4, 5]

arr.any? { |n| n > 3 }    # => true   (at least one matches)
arr.all? { |n| n > 0 }    # => true   (every element matches)
arr.none? { |n| n > 10 }  # => true   (no element matches)
arr.one? { |n| n > 4 }    # => true   (exactly one matches)

arr.count { |n| n.even? }  # => 2
arr.min                     # => 1
arr.max                     # => 5
arr.minmax                  # => [1, 5]
arr.sum                     # => 15
arr.sort                    # => [1, 2, 3, 4, 5]
arr.flat_map { |n| [n, -n] } # => [1, -1, 2, -2, 3, -3, 4, -4, 5, -5]

arr.each_with_index { |n, i| puts "#{i}: #{n}" }
arr.each_slice(2).to_a     # => [[1, 2], [3, 4], [5]]
arr.each_cons(2).to_a      # => [[1, 2], [2, 3], [3, 4], [4, 5]]
arr.zip([10, 20, 30])      # => [[1, 10], [2, 20], [3, 30]]
```

---

# Summary

| Method | Purpose | Returns |
|---|---|---|
| `map` | Transform each element | New array |
| `select` | Keep elements matching condition | New array |
| `reject` | Remove elements matching condition | New array |
| `find` | First element matching condition | Single element or nil |
| `reduce` | Accumulate into one value | Single value |
| `group_by` | Group elements by block result | Hash |
| `each_with_object` | Build a collection while iterating | The accumulator object |
| `any?` / `all?` / `none?` / `one?` | Predicate checks | Boolean |
| `count` / `min` / `max` / `sum` | Aggregation | Single value |
| `flat_map` | Map + flatten one level | New array |
| `each_slice` / `each_cons` | Chunk into groups | Enumerator |
