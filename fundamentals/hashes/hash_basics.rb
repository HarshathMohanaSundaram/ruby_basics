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