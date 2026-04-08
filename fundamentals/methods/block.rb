def my_each(array)
  i = 0
  while i < array.length
    yield(array[i])
    i+=1
  end
  array
end

my_each([1,2,3]) do |num|
  puts num
end

def my_map(array)
  result = []
  my_each(array) do |num|
    result << yield(num)
  end
  result
end

a = my_map([1,2,3]) { |num| num * 2 }
puts a


def around
  puts "Before"
  yield
  puts "After"
end

around do
  puts "Doing Work"
end
