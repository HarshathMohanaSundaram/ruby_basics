def custom_reduce(array, initial_value)
  accumulator = initial_value

  i = 0

  while i < array.length do
    accumulator = yield(accumulator, array[i])
    i += 1
  end
  accumulator
end

sum = custom_reduce([1, 2, 3], 0) do |acc, num|
  acc + num
end

product = custom_reduce([1, 2, 3, 4], 1) do |acc, num|
  acc * num
end
puts "Sum: #{sum}"
puts "Product: #{product}"