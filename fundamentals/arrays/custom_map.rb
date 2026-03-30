def custom_map(array)
  result = []
  array.each do |element|
    result << yield(element)
  end
  result
end

numbers = [1,2,3]
squared_numbers = custom_map(numbers) { |n| n * n }
puts squared_numbers.inspect