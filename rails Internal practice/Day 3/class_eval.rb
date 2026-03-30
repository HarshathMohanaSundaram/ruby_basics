class User end

User.class_eval do
  define_method(:say_hello) do
    "Hello!"
  end
end

user = User.new
puts user.say_hello # => "Hello!"


class Product
end

Product.class_eval do
  %w(name price).each do |attribute|
    define_method("#{attribute}=") do |value|
      instance_variable_set("@#{attribute}", value)
    end

    define_method(attribute) do
      instance_variable_get("@#{attribute}")
    end
  end
end

product = Product.new
product.name = "Laptop"
product.price = 999.99
puts product.name  # => "Laptop"
puts product.price # => 999.99

class Author
  @books = []
end

Author.class_eval do
  define_method(:books) do
    @books ||= []
  end
end

author = Author.new
puts author.books.inspect # => []
author.books << "Book 1"
puts author.books.inspect # => ["Book 1"]


class Router
  METHODS = %w(get post put delete)
  @routes = []

  class << self
    attr_reader :routes

    def draw(&block)
      instance_eval(&block)
    end

    METHODS.each do |method|
      define_method(method) do |path|
        @routes << { method: method.upcase, path: path }
      end
    end

    def method_missing(name, *args)
      puts "Undefined Route: #{name} with args #{args.inspect}"
    end
  end
end

Router.draw do
  get '/home'
  post '/login'
  put '/profile'
  delete '/account'
  patch '/update' # This will trigger method_missing
end

puts Router.routes