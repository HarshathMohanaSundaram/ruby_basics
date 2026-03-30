numbers = [1,2,3,4,5]

numbers.each do |num|
  puts num * 2
end

#Output:
#2
#4
#6
#8
#10

numbers = [10,20,30,40,50]

numbers.each do |num|
  puts num * 2 if num > 25
end
#Output:
#60
#80
#100

numbers = [1,2,3]

result = numbers.map { |n| n * 2 }

p result
#Output:
#[2, 4, 6]

numbers = [1,2,3]

result = numbers.map do |n|
  puts n
end

p result
#Output:
#1
#2
#3
#[nil, nil, nil]