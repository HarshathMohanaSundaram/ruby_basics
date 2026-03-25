# Ruby Metaprogramming – Day 3 Learning Notes

Author: Harshath
Focus Topics: `instance_eval`, `class_eval`, DSL design, dynamic methods, and Ruby routing DSL.

---

# 1. Introduction

Today we explored **Ruby metaprogramming**, which is the ability of Ruby to **write code that modifies code at runtime**.

These techniques are heavily used in frameworks such as:

* Ruby on Rails
* RSpec
* ActiveAdmin
* Sidekiq
* Sinatra

The major tools covered today were:

```
instance_eval
class_eval
define_method
method_missing
DSL (Domain Specific Language)
```

---

# 2. instance_eval

## Definition

`instance_eval` executes a block **in the context of an object** by changing `self` to that object.

```
object.instance_eval { code }
```

Inside the block:

```
self = object
```

So any method call inside the block will be sent to that object.

---

## Example

```ruby
class Person
  def greet
    puts "Hello!"
  end
end

person = Person.new

person.instance_eval do
  greet
end
```

Output:

```
Hello!
```

Explanation:

Inside the block:

```
self = person
```

So Ruby interprets:

```
greet
```

as

```
person.greet
```

---

## Accessing Private Instance Variables

`instance_eval` also allows access to private instance variables.

```ruby
class Secret
  def initialize
    @password = "Test@123"
  end
end

secret = Secret.new

secret.instance_eval do
  puts @password
end
```

Output:

```
Test@123
```

Because the block runs inside the object.

---

# 3. class_eval

## Definition

`class_eval` executes code **inside the context of a class**.

This allows dynamic modification of the class.

```
ClassName.class_eval { code }
```

Inside the block:

```
self = ClassName
```

---

## Example

```ruby
class User
end

User.class_eval do
  define_method(:say_hello) do
    "Hello!"
  end
end

user = User.new
puts user.say_hello
```

Output:

```
Hello!
```

Explanation:

The method `say_hello` is dynamically added to the `User` class.

---

# 4. define_method

`define_method` dynamically creates methods at runtime.

It is defined inside the **Module class**, which means it can be used in classes and modules.

Example:

```ruby
class Calculator
  define_method(:add) do |a, b|
    a + b
  end
end
```

---

# 5. Dynamic Method Creation Example

We dynamically created arithmetic methods using a hash of lambdas.

```ruby
class Calculator
  OPERATIONS = {
    add: ->(*args) { args.reduce(0, :+) },
    subtract: ->(*args) { args.reduce(:-) },
    multiply: ->(*args) { args.reduce(1, :*) }
  }

  OPERATIONS.each do |method, block|
    define_method(method) do |*args|
      block.call(*args)
    end
  end
end

calc = Calculator.new

puts calc.add(1,2,3)
puts calc.subtract(10,2,3)
puts calc.multiply(2,3,4)
```

Output:

```
6
5
24
```

---

# 6. Dynamic Attributes (Mini ActiveRecord)

Rails dynamically generates attribute methods like:

```
user.name
user.name=
```

We implemented something similar.

```ruby
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
```

Usage:

```ruby
product = Product.new
product.name = "Laptop"
product.price = 999.99

puts product.name
puts product.price
```

Output:

```
Laptop
999.99
```

---

# 7. Domain Specific Language (DSL)

A DSL is a **mini-language built inside Ruby** to make configuration or logic more readable.

Examples:

Rails Routes:

```
get "/users"
post "/login"
```

RSpec:

```
describe User do
  it "creates user"
end
```

ActiveRecord:

```
has_many :posts
```

---

# 8. Building a Router DSL

We built a mini router similar to Rails routing.

```ruby
class Router
  METHODS = %i[get post put delete]
  @routes = []

  class << self
    attr_reader :routes

    def draw(&block)
      instance_eval(&block)
    end

    METHODS.each do |method|
      define_method(method) do |path|
        @routes << { method: method.to_s.upcase, path: path }
      end
    end

    def method_missing(name, *args)
      puts "Undefined Route: #{name} with args #{args.inspect}"
    end
  end
end
```

Usage:

```ruby
Router.draw do
  get "/home"
  post "/login"
  put "/profile"
  delete "/account"
  patch "/update"
end
```

Output:

```
Undefined Route: patch with args ["/update"]

[{:method=>"GET", :path=>"/home"},
 {:method=>"POST", :path=>"/login"},
 {:method=>"PUT", :path=>"/profile"},
 {:method=>"DELETE", :path=>"/account"}]
```

---

# 9. Important Metaprogramming Concepts Learned

### 1. instance_eval

Changes execution context to an object.

```
self = object
```

Used in:

* DSLs
* configuration blocks
* testing frameworks

---

### 2. class_eval

Executes code inside a class.

```
self = ClassName
```

Used to dynamically modify classes.

---

### 3. define_method

Creates methods dynamically.

Used for:

* macros
* attribute generators
* DSL features

---

### 4. method_missing

Intercepts calls to undefined methods.

Example:

```
database "postgres"
```

Ruby internally calls:

```
method_missing(:database, "postgres")
```

---

# 10. Difference Between instance_eval and class_eval

| Feature        | instance_eval            | class_eval              |
| -------------- | ------------------------ | ----------------------- |
| Changes `self` | Object                   | Class                   |
| Used for       | Object context execution | Class modification      |
| Common usage   | DSL blocks               | dynamic method creation |

---

# 11. Real Rails Internals

Rails uses these techniques extensively.

Example: ActiveRecord association.

```
has_many :posts
```

Internally Rails dynamically generates:

```
author.posts
author.posts << post
author.posts.build
author.posts.create
```

using:

```
class_eval
define_method
```

---

# 12. Key Takeaways

* Ruby allows modifying code at runtime.
* `instance_eval` executes code inside an object's context.
* `class_eval` modifies classes dynamically.
* `define_method` creates methods dynamically.
* DSLs make APIs more expressive.
* Rails heavily relies on Ruby metaprogramming.

---

# 13. Next Learning Topics

Next topics will focus on deeper Ruby internals:

```
Singleton classes (Eigenclass)
method lookup chain
class << self
building ActiveRecord-style associations
```

These concepts explain **how Rails internally generates methods like `has_many` and `belongs_to`.**
