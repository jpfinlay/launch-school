# Exercise 05.rb

# Find a whether a value is in a hash:

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts "Is Bob in the person hash?"
p person.has_value?("Bob") # => true
