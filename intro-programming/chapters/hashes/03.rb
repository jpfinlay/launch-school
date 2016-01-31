# Exercise 03.rb

# 1. A program that loops through a hash and prints all of the keys.
# 2. Then write a program that does the same thing except printing the values.
# 3. A program that prints both.

player = {name: 'Daniel', age: 25, position: 'forward'}

puts "Print the keys:"
player.keys.each { |key| puts "#{key} is a key." }
puts "Print the values:"
player.values.each { |value| puts "#{value} is a value." }
puts "Print both the keys and values:"
player.each { |k,v| puts "Key #{k} has a value of #{v}." }

# Better way for the first two exercises:
puts "---"
puts "Using hash methods #each_key and #each_value..."
player.each_key { |key| puts key }
player.each_value { |value| puts value }
