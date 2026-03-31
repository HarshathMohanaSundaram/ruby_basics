# lazy_enumerator.rb
# Demonstrates Lazy Enumerators in Ruby

# Without lazy
puts "Without lazy:"
result = (1..100)
          .map do |n|
            puts "Mapping #{n}"
            n * 2
          end
          .select do |n|
            puts "Selecting #{n}"
            n > 50
          end
          .first(3)

p result

# With lazy
puts "\nWith lazy:"
result = (1..Float::INFINITY)
          .lazy
          .map { |n| n * 2 }
          .select { |n| n > 50 }
          .first(3)

p result

# Lazy evaluation demonstration
puts "\nLazy evaluation step tracing:"

numbers = (1..Float::INFINITY).lazy

result = numbers
          .map do |n|
            puts "Mapping #{n}"
            n * 2
          end
          .select do |n|
            puts "Filtering #{n}"
            n > 10
          end
          .first(2)

puts "Final Result:"
p result

# Infinite sequence example
puts "\nInfinite sequence example:"
multiples_of_five = (1..Float::INFINITY)
                      .lazy
                      .select { |n| n % 5 == 0 }
                      .first(5)

p multiples_of_five