# Ruby Hash Operations

This document covers the most commonly used Hash operations in Ruby. Hashes are collections of key-value pairs where each key is unique.

---

# 1. Creating Hashes

```ruby
h = {}
h = { name: "Arun", marks: 85 }
h = Hash.new
h = Hash.new(0)
h = Hash.new { |hash, key| hash[key] = [] }
```

Example:

```ruby
student = {
  name: "Arun",
  marks: 85,
  city: "Chennai"
}
# => {:name=>"Arun", :marks=>85, :city=>"Chennai"}
```

---

# 2. Accessing Elements

```ruby
h = { name: "Arun", marks: 85 }

h[:name]
h.fetch(:name)
h.fetch(:grade, "N/A")

h.keys
h.values
```

`fetch` raises a `KeyError` if the key does not exist unless a default value is provided.

---

# 3. Adding / Updating Elements

```ruby
student = { name: "Arun", marks: 85 }

student[:grade] = "A"
student[:marks] = 90

student.merge!({ city: "Chennai" })
```

Example:

```ruby
student = { name: "Arun" }
student[:marks] = 85
# => {:name=>"Arun", :marks=>85}
```

---

# 4. Removing Elements

```ruby
h = { a: 1, b: 2, c: 3 }

h.delete(:b)
h.delete_if { |k, v| v < 2 }

h.clear
```

Example:

```ruby
student = { name: "Arun", marks: 85, city: "Chennai" }
student.delete(:city)
# => {:name=>"Arun", :marks=>85}
```

---

# 5. Checking Hash Properties

```ruby
h.empty?
h.length
h.size
h.key?(:name)
h.value?(85)
h.has_key?(:name)
h.has_value?(85)
```

Example:

```ruby
{ a: 1, b: 2 }.key?(:a)
# => true
```

---

# 6. Iterating Over Hashes

```ruby
h.each { |key, value| puts "#{key}: #{value}" }

h.each_key { |k| puts k }
h.each_value { |v| puts v }

h.each_with_object([]) { |(k, v), arr| arr << "#{k}=#{v}" }
```

Example:

```ruby
student = { name: "Arun", marks: 85 }
student.each do |key, value|
  puts "#{key}: #{value}"
end
# name: Arun
# marks: 85
```

---

# 7. Merge vs Merge!

`merge` returns a new hash without modifying the original. `merge!` (aliased as `update`) modifies the hash in place.

```ruby
user = { name: "Harshath", age: 25 }
address = { city: "Chennai", country: "India" }

result = user.merge(address)
p result  # => {:name=>"Harshath", :age=>25, :city=>"Chennai", :country=>"India"}
p user    # => {:name=>"Harshath", :age=>25}  (unchanged)

user.merge!(address)
p user    # => {:name=>"Harshath", :age=>25, :city=>"Chennai", :country=>"India"}  (modified)
```

When keys conflict, the merging hash wins:

```ruby
h1 = { a: 1, b: 2 }
h2 = { b: 10 }

h1.merge(h2)
# => {:a=>1, :b=>10}
```

---

# 8. Filtering Elements

```ruby
scores = { math: 90, science: 40, english: 80 }

scores.select { |k, v| v > 50 }
scores.reject { |k, v| v < 50 }
```

Example:

```ruby
scores = { math: 90, science: 40, english: 80 }

scores.select { |k, v| v > 50 }
# => {:math=>90, :english=>80}

scores.reject { |k, v| v < 50 }
# => {:math=>90, :english=>80}
```

---

# 9. Transforming Values

`transform_values` returns a new hash. `transform_values!` modifies in place.

```ruby
scores = { math: 10, science: 20, english: 15 }

scores.transform_values { |v| v * 2 }
# => {:math=>20, :science=>40, :english=>30}

p scores
# => {:math=>10, :science=>20, :english=>15}  (unchanged)

scores.transform_values! { |v| v * 2 }
p scores
# => {:math=>20, :science=>40, :english=>30}  (modified)
```

---

# 10. Transforming Keys

`transform_keys` returns a new hash. `transform_keys!` modifies in place.

```ruby
person = { name: "Harshath", age: 25 }

person.transform_keys { |k| k.to_s }
# => {"name"=>"Harshath", "age"=>25}

p person
# => {:name=>"Harshath", :age=>25}  (unchanged)

person.transform_keys!(&:to_s)
p person
# => {"name"=>"Harshath", "age"=>25}  (modified)
```

---

# 11. Inverting a Hash

`invert` swaps keys and values. Does not modify the original hash.

```ruby
h = { a: 1, b: 2 }

h.invert
# => {1=>:a, 2=>:b}

p h
# => {:a=>1, :b=>2}  (unchanged)
```

**Note:** If there are duplicate values, only the last key-value pair is kept after inversion.

---

# 12. Nested Hash Access with dig

`dig` safely accesses deeply nested values without raising errors for missing keys.

```ruby
data = {
  user: {
    address: {
      city: "Chennai"
    }
  }
}

data[:user][:address][:city]
# => "Chennai"

data.dig(:user, :address, :city)
# => "Chennai"

data.dig(:user, :phone, :number)
# => nil  (no error raised)
```

Without `dig`, accessing a missing nested key raises `NoMethodError`:

```ruby
data[:user][:phone][:number]
# => NoMethodError: undefined method `[]' for nil
```

---

# 13. Default Values and default_proc

`Hash.new` accepts a default value or a block (`default_proc`) for missing keys.

```ruby
# Default value
h = Hash.new(0)
h[:count] += 1
p h[:count]   # => 1
p h[:missing] # => 0

# default_proc
h = Hash.new { |hash, key| hash[key] = [] }
h[:ruby] << "arrays"
h[:ruby] << "hashes"
p h  # => {:ruby=>["arrays", "hashes"]}
```

Without `default_proc`, accessing a missing key returns `nil`:

```ruby
h = Hash.new
h[:ruby] << "arrays"
# => NoMethodError: undefined method `<<' for nil
```

---

# 14. group_by (Enumerable)

`group_by` groups elements of a collection into a hash based on the block's return value.

```ruby
numbers = [1, 2, 3, 4, 5, 6]
numbers.group_by { |n| n.even? }
# => {false=>[1, 3, 5], true=>[2, 4, 6]}

words = ["apple", "bat", "ball", "cat"]
words.group_by { |w| w.length }
# => {5=>["apple"], 3=>["bat", "bal", "cat"]}
```

---

# 15. slice and except

`slice` returns a new hash with only the specified keys. `except` returns a new hash without the specified keys. Neither modifies the original.

```ruby
person = { name: "Harshath", age: 25, city: "Chennai", country: "India" }

person.slice(:name, :city)
# => {:name=>"Harshath", :city=>"Chennai"}

person.except(:name, :age)
# => {:city=>"Chennai", :country=>"India"}

p person
# => {:name=>"Harshath", :age=>25, :city=>"Chennai", :country=>"India"}  (unchanged)
```

---

# 16. compact and compact!

`compact` removes key-value pairs with `nil` values. `compact!` modifies in place.

```ruby
data = { name: "Harshath", age: nil, city: "Chennai" }

data.compact
# => {:name=>"Harshath", :city=>"Chennai"}

p data
# => {:name=>"Harshath", :age=>nil, :city=>"Chennai"}  (unchanged)

data.compact!
p data
# => {:name=>"Harshath", :city=>"Chennai"}  (modified)
```

---

# 17. Deep Merge (ActiveSupport)

Ruby's `merge` does a shallow merge — nested hashes are replaced, not combined. ActiveSupport provides `deep_merge` for recursive merging.

```ruby
h1 = { user: { name: "Harshath" } }
h2 = { user: { age: 25 } }

h1.merge(h2)
# => {:user=>{:age=>25}}  (nested hash replaced)

require "active_support/core_ext/hash/deep_merge"

h1.deep_merge(h2)
# => {:user=>{:name=>"Harshath", :age=>25}}  (nested hash merged)
```

---

# 18. Mutation vs Non-Mutation

Non-mutating methods return a new hash:

```ruby
h.merge(other)
h.select { |k, v| v > 1 }
h.transform_values { |v| v * 2 }
h.transform_keys { |k| k.to_s }
h.compact
h.invert
h.slice(:a, :b)
h.except(:a)
```

Mutating methods modify the original hash:

```ruby
h.merge!(other)
h.select! { |k, v| v > 1 }
h.transform_values! { |v| v * 2 }
h.transform_keys! { |k| k.to_s }
h.compact!
h.delete(:key)
h.delete_if { |k, v| v < 2 }
h.clear
```

Methods ending with `!` usually mutate the hash.

---

# Summary

Important Hash concept groups:

* Creation and default values
* Accessing, adding, and removing elements
* Iterating over hashes
* Merge vs merge! (shallow merge)
* Filtering with select and reject
* Transforming keys and values
* Inverting hashes
* Nested access with dig
* default_proc for dynamic defaults
* group_by for grouping collections
* slice and except for subsetting
* compact for removing nil values
* Deep merge with ActiveSupport
* Mutation vs non-mutation
