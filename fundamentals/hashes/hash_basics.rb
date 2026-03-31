# ============================================================
# 1. Creating and Accessing a Hash
# ============================================================
# Hashes store key-value pairs using the symbol shorthand (key: value)
student = {
  name: "Arun",
  marks: 85,
  city: "Chennai"
}

# Access a value using its symbol key with [:key] syntax
puts "Name: #{student[:name]}"

# ============================================================
# 2. Adding, Updating, and Deleting Keys
# ============================================================

# merge! adds the new key-value pair directly into the existing hash (mutates)
student.merge!({grade: "A"})
puts "Grade: #{student[:grade]}"

# Assign a new value to an existing key to update it
student[:marks] = 90
puts "Marks: #{student[:marks]}"

# delete removes a key-value pair and returns the deleted value (or nil if key missing)
student.delete(:city)
puts "City: #{student[:city]}" # => nil, since :city was deleted

# .keys returns an array of all keys in the hash
puts student.keys


# ============================================================
# 3. Iterating Over a Hash
# ============================================================

# .each yields each key-value pair as two block parameters
student.each do |key, value|
  puts "#{key}: #{value}"
end


# ============================================================
# 4. merge vs merge! (Non-mutating vs Mutating)
# ============================================================
puts "Merge vs Merge! Example:"
user = { name: "Harshath", age: 25 }
address = { city: "Chennai", country: "India" }

# merge returns a NEW combined hash — original `user` is unchanged
result = user.merge(address)

p result  # => {:name=>"Harshath", :age=>25, :city=>"Chennai", :country=>"India"}
p user    # => {:name=>"Harshath", :age=>25}  (unchanged)


# merge! (bang) modifies `user` in place
result_bang = user.merge!(address)
p result_bang # => {:name=>"Harshath", :age=>25, :city=>"Chennai", :country=>"India"}
p user        # => same as result_bang — user is now mutated

# When both hashes share a key, the merging hash's value wins
h1 = { a: 1, b: 2 }
h2 = { b: 10 }

p h1.merge(h2) # => {:a=>1, :b=>10}  — h2's :b overrides h1's :b

p h1 # => {:a=>1, :b=>2}  (unchanged, merge is non-mutating)


# ============================================================
# 5. transform_values / transform_values!
# ============================================================

scores = { math: 10, science: 20, english: 15 }
p scores
# transform_values returns a new hash with each value transformed by the block
p scores.transform_values { |v| v * 2 } # => {:math=>20, :science=>40, :english=>30}
p scores # => original unchanged

# transform_values! mutates the hash in place
p scores.transform_values! { |v| v * 2 } # => {:math=>20, :science=>40, :english=>30}
p scores # => now mutated

# ============================================================
# 6. select and reject — Filtering Hash Entries
# ============================================================

scores = { math: 90, science: 40, english: 80 }

# select keeps pairs where the block returns true
p scores.select { |k, v| v > 50 }  # => {:math=>90, :english=>80}
# reject removes pairs where the block returns true
p scores.reject { |k, v| v < 50 }  # => {:math=>90, :english=>80}


# ============================================================
# 7. transform_keys / transform_keys!
# ============================================================

person = { name: "Harshath", age: 25 }

# transform_keys returns a new hash with keys transformed by the block
p person.transform_keys { |k| k.to_s } # => {"name"=>"Harshath", "age"=>25}

p person # => {:name=>"Harshath", :age=>25}  (unchanged)

# transform_keys! mutates in place; &:to_s is shorthand for { |k| k.to_s }
person.transform_keys!(&:to_s)
p person # => {"name"=>"Harshath", "age"=>25}  (mutated)


# ============================================================
# 8. invert — Swap Keys and Values
# ============================================================

h = { a: 1, b: 2 }

# invert returns a new hash with keys and values swapped (non-mutating)
p h.invert # => {1=>:a, 2=>:b}

p h # => {:a=>1, :b=>2}  (unchanged)


# ============================================================
# 9. Nested Hash Access with dig
# ============================================================

data = {
  user: {
    address: {
      city: "Chennai"
    }
  }
}

# Chained [] access — works but raises NoMethodError if any intermediate key is missing
p data[:user][:address][:city] # => "Chennai"
# dig safely navigates nested hashes — returns nil instead of raising an error
p data.dig(:user, :address, :city) # => "Chennai"


# ============================================================
# 10. Combining Multiple Hash Operations
# ============================================================

users = {
  alice: 25,
  bob: 17,
  charlie: 30,
  david: 15
}

# Filter users aged 18+
p users.select { |_, age| age>=18 }          # => {:alice=>25, :charlie=>30}
# Add 5 to every age (returns new hash)
p users.transform_values { |age| age +=5 }   # => {:alice=>30, :bob=>22, :charlie=>35, :david=>20}
# Uppercase all keys (returns new hash)
p users.transform_keys { |name| name.to_s.upcase } # => {"ALICE"=>25, "BOB"=>17, ...}
# Swap keys and values
p users.invert                                # => {25=>:alice, 17=>:bob, 30=>:charlie, 15=>:david}
# Add a new entry via merge (returns new hash)
p users.merge({eve: 20})                      # => {:alice=>25, ..., :eve=>20}


# ============================================================
# 11. default_proc — Auto-initialize Missing Keys
# ============================================================

# Hash.new with a block sets a default_proc: when a missing key is accessed,
# the block runs and assigns the default value (here, an empty array)
h = Hash.new { |hash, key| hash[key] = [] }
h[:ruby] << "arrays"  # :ruby didn't exist → default_proc creates [] → appends "arrays"
h[:ruby] << "hashes"  # :ruby now exists → appends "hashes"

p h # => {:ruby=>["arrays", "hashes"]}

# without default_proc — accessing a missing key returns nil, so << fails
# h2 = Hash.new
# h2[:ruby] << "arrays"
# h2[:ruby] << "hashes"
# p h2

# hash_basics.rb:114:in `<main>': undefined method `<<' for nil (NoMethodError)

# h2[:ruby] << "arrays"

# ============================================================
# 12. group_by (Enumerable) — Group Elements into a Hash
# ============================================================

numbers = [1,2,3,4,5,6]

# group_by returns a hash where keys are the block's return values
# and values are arrays of elements that produced that key
p numbers.group_by { |n| n.even? } # => {false=>[1,3,5], true=>[2,4,6]}

words = ["apple", "bat", "ball", "cat"]

# Group words by their length
p words.group_by { |w| w.length } # => {5=>["apple"], 3=>["bat","ball","cat"]}

# ============================================================
# 13. slice and except — Subsetting a Hash
# ============================================================

person = {
  name: "Harshath",
  age: 25,
  city: "Chennai",
  country: "India"
}

# slice returns a new hash with ONLY the specified keys
p person.slice(:name, :city) # => {:name=>"Harshath", :city=>"Chennai"}
p person                     # => original unchanged

# except returns a new hash WITHOUT the specified keys
p person.except(:name, :age) # => {:city=>"Chennai", :country=>"India"}
p person                     # => original unchanged

# ============================================================
# 14. compact / compact! — Remove nil Values
# ============================================================

data = {
  name: "Harshath",
  age: nil,
  city: "Chennai"
}

# compact returns a new hash with all nil-value pairs removed
p data.compact  # => {:name=>"Harshath", :city=>"Chennai"}
p data          # => original unchanged (still has age: nil)
# compact! mutates in place, returns self (or nil if nothing changed)
p data.compact! # => {:name=>"Harshath", :city=>"Chennai"}
p data          # => now mutated — age: nil is gone

# ============================================================
# 15. Deep Merge (ActiveSupport) — Recursively Merge Nested Hashes
# ============================================================

h1 = {
  user: {
    name: "Harshath"
  }
}

h2 = {
  user: {
    age: 25
  }
}

# Standard merge does a SHALLOW merge — the entire :user value is replaced by h2's
p h1.merge(h2) # => {:user=>{:age=>25}}  (h1[:user][:name] is lost!)

# deep_merge from ActiveSupport recursively merges nested hashes
require "active_support/core_ext/hash/deep_merge"
p h1.deep_merge(h2) # => {:user=>{:name=>"Harshath", :age=>25}}