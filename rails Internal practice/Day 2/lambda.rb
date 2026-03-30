def make_multiplier(multiplier)
  lambda { |x| x * multiplier }
end
double = make_multiplier(2)
puts double.call(5) # Output: 10


postive = -> (n) { n > 0}
even = -> (n) { n.even? }

def validate(number, validators)
  validators.all? { |validator| validator.call(number) }
end

puts validate(4, [postive, even]) # Output: true
puts validate(-3, [postive, even]) # Output: false
