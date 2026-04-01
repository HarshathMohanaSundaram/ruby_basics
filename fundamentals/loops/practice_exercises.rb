numbers.each do |number|
i=0
numbers.length.times do |i|
i = 0
numbers = [10, 20, 30, 40, 50]

# Using each: idiomatic Ruby for element-wise iteration
# Expected output:
# 10
# 20
# 30
# 40
# 50
numbers.each do |number|
  puts number
end

# Using while loop with index: manual control
# Expected output:
# 10
# 20
# 30
# 40
# 50
i = 0
while i < numbers.length
  puts numbers[i]
  i += 1
end

# Using for-in: iterates directly over elements
# Expected output:
# 10
# 20
# 30
# 40
# 50
for i in numbers
  puts i
end

# Using times with index: fixed-count iteration
# Expected output:
# 10
# 20
# 30
# 40
# 50
numbers.length.times do |i|
  puts numbers[i]
end

# Using while with next: skips 30
# Expected output:
# 10
# 20
# 40
# 50
i = 0
while i < numbers.length
  if numbers[i] == 30
    i += 1
    next
  end
  puts numbers[i]
  i += 1
end