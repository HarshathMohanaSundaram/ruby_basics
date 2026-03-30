class Calculator
  OPERATIONS = {
  :add => Proc.new { |*args| args.reduce(0, :+)},
  :subtract => Proc.new { |*args| args.reduce(:-)},
  :multiply => Proc.new { |*args| args.reduce(1, :*)}
}

  OPERATIONS.each do|method, block|
    define_method(method) do |*args|
      block.call(*args)
    end
  end
end


calc = Calculator.new

calc.instance_eval do
  puts add(1, 2, 3)        # => 6
  puts subtract(10, 2, 3)  # => 5
  puts multiply(2, 3, 4)   # => 24
end


class Secret
  def initialize
    @password = 'Test@123'
  end
end

secret = Secret.new

secret.instance_eval do
  puts @password # => 'Test@123'
end


class App
  @settings = {}

  class << self
    attr_reader :settings

    def configure(&block)
      instance_eval(&block)
    end

    def method_missing(name, value)
      @settings[name] = value
    end
  end
end

App.configure do
  database 'postgres'
  cache 'redis'
end

puts App.settings # => {"database"=>"postgres", "cache"=>"redis"}
