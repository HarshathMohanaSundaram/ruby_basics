numbers = [10,20,30,40,50]

numbers.each do |number|
  puts number
end

i=0
while i < numbers.length
  puts numbers[i]
  i += 1
end

for i in numbers
  puts i
end

numbers.length.times do |i|
  puts numbers[i]
end

i = 0
while i < numbers.length
  if numbers[i] == 30
    i+=1
    next
  end
  puts numbers[i]
  i += 1
end