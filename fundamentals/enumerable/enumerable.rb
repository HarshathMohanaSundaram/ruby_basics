# ============================================================
# 1. map — Transform Every Element
# ============================================================
# map returns a new array with each element transformed by the block
numbers = [1,2,3,4]

p numbers.map { |n| n * 2 } # => [2, 4, 6, 8]

# ============================================================
# 2. select and reject — Filtering Elements
# ============================================================
numbers = [1,2,3,4,5,6]

# select keeps elements where the block returns true
p numbers.select { |n| n.even? } # => [2, 4, 6]

# reject removes elements where the block returns true (opposite of select)
p numbers.reject { |n| n.even? } # => [1, 3, 5]

# ============================================================
# 3. find (detect) — First Matching Element
# ============================================================
numbers = [3,7,10,20]

# find returns the FIRST element where the block returns true (not all matches)
p numbers.find { |n| n > 5 } # => 7

# ============================================================
# 4. reduce (inject) — Accumulate into a Single Value
# ============================================================
numbers = [1,2,3,4]

# reduce takes an initial accumulator (0) and combines each element into it
p numbers.reduce(0) { |sum, n| sum + n } # => 10

# Shorthand: pass a symbol for the operation — no block needed
p numbers.reduce(:+) # => 10  (sum)
p numbers.reduce(:*) # => 24  (product: 1*2*3*4)

# ============================================================
# 5. group_by — Group Elements into a Hash
# ============================================================
numbers = [1,2,3,4,5,6]

# group_by returns a hash: keys are the block's return values,
# values are arrays of elements that produced that key
p numbers.group_by { |n| n.even? } # => {false=>[1,3,5], true=>[2,4,6]}

words = ["apple","bat","ball","cat"]

# Group words by their length
words.group_by { |w| w.length }
# => {5=>["apple"], 3=>["bat","ball","cat"]}

# ============================================================
# 6. each_with_object — Build a Collection While Iterating
# ============================================================

[
  [2,4,6],
  [1,3,5]
]

numbers = [1,2,3]

# each_with_object passes an accumulator object ({} here) to each iteration.
# Unlike reduce, the accumulator is always the SECOND block parameter.
# Returns the accumulator after all iterations.
numbers.each_with_object({}) do |n, hash|
  hash[n] = n * n
end
# => {1=>1, 2=>4, 3=>9}

# ============================================================
# 7. Enumerable Works on Hashes Too
# ============================================================
scores = {
  math: 90,
  science: 40,
  english: 80
}

# select on a hash keeps key-value pairs where the block returns true
scores.select { |k,v| v > 50 }
# => {:math=>90, :english=>80}