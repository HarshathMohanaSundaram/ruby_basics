def custom_select(array)
  selected_elements = []

  i=0

  while i < array.length do
    selected_elements << array[i] if yield(array[i])
    i += 1 
  end

  selected_elements
end

p custom_select([1,2,3,4,5]) { |n| n.odd? }
