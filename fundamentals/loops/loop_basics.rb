i = 1

loop do
  puts i
  break if i == 5
  i += 1
end

i = 1

while i <= 5
  puts i
  i += 1
end

i = 1

until i > 5
  puts i
  i += 1
end

for i in 1..5
  puts i
end

5.times do |i|
  puts i
end

1.upto(5) do |i|
  puts i
end

5.downto(1) do |i|
  puts i
end

1.step(10, 5) do |i|
  puts i
end

i = 0

while i < 3
  puts i
  i += 1
  redo if i == 2
end