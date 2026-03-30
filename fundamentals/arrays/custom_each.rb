def custom_each(array)
  for element in array
    yield(element)
  end

  array
end

array = custom_each([1,2,3]) do |num|
  puts num * 2
end

puts "Returned array: #{array.inspect}"
