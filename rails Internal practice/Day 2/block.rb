def my_each(array)
  array.each do |element|
    yield(element)
  end
end


my_each([1, 2, 3]) do |num|
  puts num * 2
end

#Output:
#2
#4
#6

#Safe Block Execution

def greet
  if block_given?
    yield
  else
    puts "No Block Given"
  end
end


greet { puts "Hello!" }
greet

#Output:
#Hello!
#No Block Given


def repeat(n)
  n.times { yield }
end

repeat(3) { puts "Hello!" }

#Output:
#Hello!
#Hello! 
#Hello!
