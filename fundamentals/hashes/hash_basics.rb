student = {
  name: "Arun",
  marks: 85,
  city: "Chennai"
}

puts "Name: #{student[:name]}"

student.merge!({grade: "A"})
puts "Grade: #{student[:grade]}"

student[:marks] = 90
puts "Marks: #{student[:marks]}"

student.delete(:city)
puts "City: #{student[:city]}"

puts student.keys


student.each do |key, value|
  puts "#{key}: #{value}"
end


puts "Merge vs Merge! Example:"
user = { name: "Harshath", age: 25 }
address = { city: "Chennai", country: "India" }

result = user.merge(address)

p result
p user


result_bang = user.merge!(address)
p result_bang
p user

h1 = { a: 1, b: 2 }
h2 = { b: 10 }

p h1.merge(h2)

p h1


scores = { math: 10, science: 20, english: 15 }
p scores
p scores.transform_values { |v| v * 2 }
p scores

p scores.transform_values! { |v| v * 2 }
p scores

scores = { math: 90, science: 40, english: 80 }

p scores.select { |k, v| v > 50 }
p scores.reject { |k, v| v < 50 }


person = { name: "Harshath", age: 25 }

p person.transform_keys { |k| k.to_s }

p person

person.transform_keys!(&:to_s)
p person


h = { a: 1, b: 2 }

p h.invert

p h


data = {
  user: {
    address: {
      city: "Chennai"
    }
  }
}

p data[:user][:address][:city]
p data.dig(:user, :address, :city)


users = {
  alice: 25,
  bob: 17,
  charlie: 30,
  david: 15
}

p users.select { |_, age| age>=18 }
p users.transform_values { |age| age +=5 }
p users.transform_keys { |name| name.to_s.upcase }
p users.invert
p users.merge({eve: 20})


# default_proc
h = Hash.new { |hash, key| hash[key] = [] }
h[:ruby] << "arrays"
h[:ruby] << "hashes"

p h

# without default_proc
# h2 = Hash.new
# h2[:ruby] << "arrays"
# h2[:ruby] << "hashes"
# p h2

# hash_basics.rb:114:in `<main>': undefined method `<<' for nil (NoMethodError)

# h2[:ruby] << "arrays"

numbers = [1,2,3,4,5,6]

p numbers.group_by { |n| n.even? }
words = ["apple", "bat", "ball", "cat"]

p words.group_by { |w| w.length }

person = {
  name: "Harshath",
  age: 25,
  city: "Chennai",
  country: "India"
}

p person.slice(:name, :city)
p person

p person.except(:name, :age)
p person

data = {
  name: "Harshath",
  age: nil,
  city: "Chennai"
}

p data.compact
p data
p data.compact!
p data

h1 = {
  user: {
    name: "Harshath"
  }
}

h2 = {
  user: {
    age: 25
  }
}

p h1.merge(h2)
require "active_support/core_ext/hash/deep_merge"
p h1.deep_merge(h2)