class MyArray
  def initialize(array)
    @array = array
  end

  def each
    return enum_for(:each) unless block_given?

    i = 0
    while i < @array.length
      yield @array[i]
      i += 1
    end
  end

  def map
    return enum_for(:map) unless block_given?

    result = []
    each {|element| result << yield(element) }
    result
  end

  def select
    return enum_for(:select) unless block_given?

    result = []
    each {|element| result << element if yield(element) }
    result
  end

  def reject
    return enum_for(:reject) unless block_given?

    result = []
    each {|element| result << element unless yield(element) }
    result
  end

  def each_for
    return enum_for(:each_for) unless block_given?

    for i in 0...@array.length
      yield @array[i]
    end
  end

  def map_for
    return enum_for(:map_for) unless block_given?

    result = []

    each_for { |element| result << yield(element) }
    result
  end

  def select_for
    return enum_for(:select_for) unless block_given?


    result = []

    each_for { |element| result << element if yield(element) }
    result
  end

  def reject_for
    return enum_for(:reject_for) unless block_given?

    result = []

    each_for { |element| result << element unless yield(element) }
    result
  end
end

# Example usage:

puts '=' * 40
puts 'Iterator Pattern Example with MyArray Class'
puts '=' * 40

puts '=' * 80
puts 'While loop implementation:'
puts '-' * 40
puts 'Using each method to multiply each number by 2:'
my_array = MyArray.new([1, 2, 3, 4, 5])
my_array.each do |number|
  puts number * 2
end
puts '-' * 40

# Output:
# 2
# 4
# 6
# 8
# 10
puts '-' * 40
puts 'Using map method to multiply each number by 3:'
mapped_array = my_array.map do |number|
  number * 3
end
puts mapped_array.inspect
puts '-' * 40

# Output:
# [3, 6, 9, 12, 15]

puts '-' * 40
puts 'Using select method to filter even numbers:'
selected_array = my_array.select do |number|
  number.even?
end
puts selected_array.inspect
puts '-' * 40
# Output:
# [2, 4]


puts '-' * 40
puts 'Using reject method to filter out even numbers:'
rejected_array = my_array.reject do |number|
  number.even?
end
puts rejected_array.inspect
puts '-' * 40
# Output:
# [1, 3, 5]
puts '=' * 80

puts "\n" * 2

puts '=' * 80
puts 'For loop implementation:'
puts '-' * 40
puts 'Using each_for method to multiply each number by 2:'
my_array.each_for do |number|
  puts number * 2
end
# Output:
# 2
# 4
# 6
# 8
# 10
puts '-' * 40

puts '-' * 40
puts 'Using map_for method to multiply each number by 3:'
mapped_array_for = my_array.map_for do |number|
  number * 3
end
puts mapped_array_for.inspect
# Output:
# [3, 6, 9, 12, 15]
puts '-' * 40

puts '-' * 40
puts 'Using select_for method to filter even numbers:'
selected_array_for = my_array.select_for do |number|
  number.even?
end
puts selected_array_for.inspect
# Output:
# [2, 4]
puts '-' * 40

puts '-' * 40
puts 'Using reject_for method to filter out even numbers:'
rejected_array_for = my_array.reject_for do |number|
  number.even?
end
puts rejected_array_for.inspect
# Output:
# [1, 3, 5]
puts '-' * 40

puts 'End of Iterator Pattern Example'

puts '=' * 80

puts "\n" * 2
puts '=' * 80
puts 'when no block is given:'
puts '-' * 40
puts 'Using each method without a block:'
enumerator = my_array.each
puts enumerator.inspect
puts '-' * 40
puts 'Using map method without a block:'
enumerator_map = my_array.map
puts enumerator_map.inspect
puts '-' * 40
puts 'Using select method without a block:'
enumerator_select = my_array.select
puts enumerator_select.inspect
puts '-' * 40
puts 'Using reject method without a block:'
enumerator_reject = my_array.reject
puts enumerator_reject.inspect
puts '-' * 40
puts 'Using each_for method without a block:'
enumerator_each_for = my_array.each_for
puts enumerator_each_for.inspect
puts '-' * 40
puts 'Using map_for method without a block:'
enumerator_map_for = my_array.map_for
puts enumerator_map_for.inspect
puts '-' * 40
puts 'Using select_for method without a block:'
enumerator_select_for = my_array.select_for
puts enumerator_select_for.inspect
puts '-' * 40
puts 'Using reject_for method without a block:'
enumerator_reject_for = my_array.reject_for
puts enumerator_reject_for.inspect
puts '-' * 40
puts 'End of Enumerator Example'
puts '=' * 80
