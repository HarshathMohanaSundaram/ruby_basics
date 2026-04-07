i = 1
i = 1
until i > 5
i = 0
i = 1

# Basic infinite loop with manual break. Good for custom exit conditions.
# Alternate: while/until loops for condition-based repetition.
loop do
  puts i
  break if i == 5
  i += 1
end

i = 1

# While loop: repeats while condition is true. Entry-controlled.
# Alternate: until for opposite condition, or loop+break for custom logic.
while i <= 5
  puts i
  i += 1
end

i = 1

# Until loop: repeats until condition is true (opposite of while).
# Alternate: while with inverted condition.
until i > 5
  puts i
  i += 1
end

# For-in loop: iterates over a range or collection.
# Alternate: each, map, or other enumerators for collections.
for i in 1..5
  puts i
end

# times: repeats block a fixed number of times (0 to n-1).
# Alternate: for, upto, or loop with counter.
5.times do |i|
  puts i
end

# upto: iterates from start to end (inclusive).
# Alternate: for, times, or each on a range.
1.upto(5) do |i|
  puts i
end

# downto: iterates from start down to end (inclusive).
# Alternate: reverse ranges or for with decreasing values.
5.downto(1) do |i|
  puts i
end

# step: iterates from start to end, incrementing by step value.
# Useful for custom increments.
1.step(10, 5) do |i|
  puts i
end

# redo: repeats current iteration without re-evaluating condition.
# Use with caution to avoid infinite loops.
i = 0
while i < 3
  puts i
  i += 1
  redo if i == 2
end
