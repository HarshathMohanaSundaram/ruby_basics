double = Proc.new { |x| x * 2 }
puts double.call(5) # Output: 10

puts [1,2,3,4].map(&double) # Output: [2, 4, 6, 8]

adder = -> (x, y) { x + y }
puts adder.call(3, 4) # Output: 7


def test_return_proc
  puts "Before Proc"

  my_proc = Proc.new { return "Inside Proc" }
  result = my_proc.call
  puts "After Proc"
  return "Method End"
end

puts test_return_proc

def test_return_lambda
  puts "Before Lambda"

  my_lambda = -> { return "Inside Lambda" }
  result = my_lambda.call
  puts "After Lambda"
  return "Method End"
end

puts test_return_lambda