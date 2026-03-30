def run_operation(a,b,operation)
  operation.call(a,b)
end

add = Proc.new{ |x,y| x+y }

puts run_operation(5,3,add)

#Output:
#8

subtract = Proc.new{ |x,y| x-y }
puts run_operation(5,3,subtract)
#Output:
#2


numbers = [1,2,3,4,5]

def filter(array, condition)
  array.select { |element| condition.call(element) }
end

even_condition = Proc.new { |x| x.even? }
puts filter(numbers, even_condition).inspect
#Output:
#[2, 4]


def pipeline(value, operations)
  prev = value
  result = nil
  operations.each do |operation|
    result = operation.call(prev)
    prev = result
  end
  result
end


double = Proc.new { |x| x * 2 }
square = Proc.new { |x| x * x  }

puts pipeline(3, [double, square]) # Output: 36
puts pipeline(3, [square, double]) # Output: 18
