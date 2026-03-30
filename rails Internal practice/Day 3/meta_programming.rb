# Challenge 1

str = 'ruby'

method = :upcase

puts str.send(method) # => 'RUBY'


# Challenge 2
class Animal
  %w(cat dog lion).each do |animal|
    define_method(animal) do
      puts "I am a #{animal}"
    end
  end
end

animal = Animal.new
animal.cat  # => "I am a cat"
animal.dog  # => "I am a dog"
animal.lion # => "I am a lion"

# Challenge 3
class Calculator
  def method_missing(method_name, *args)
    if method_name.to_s.start_with?('add')
      args.reduce(0) { |total, num| total + num }
    elsif method_name.to_s.start_with?('multiply')
      args.reduce(1) { |total, num| total * num }
    else
      puts "Method #{method_name} not defined"
    end
  end
end

calc = Calculator.new
puts calc.add(1, 2, 3)        # => 6
puts calc.multiply(2, 3, 4)   # => 24
puts calc.subtract(5, 2)      # => "Method subtract not defined"

# Challenge 4
class App
  @settings = {}

  class << self
    attr_reader :settings

    def config(&block)
      instance_eval(&block)
    end

    def method_missing(name, value)
      @settings[name] = value
    end
  end
end

App.config do
  database 'postgres'
  cache 'redis'
end

puts App.settings