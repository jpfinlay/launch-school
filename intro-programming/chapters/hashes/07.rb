# Exercise 07.rb

# What's the difference between the two hashes below?

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

puts "Given that 'x = hi there'"
puts "What is the difference between:"
puts "my_hash = {x: \"some value\"}"
puts "And"
puts "my_hash2 = {x => \"some value\"}"
puts "---"
puts "my_hash = {x: \"some value\"} has a symbol x: as the key."
puts "{:x=>\"some value\"}"
puts "my_hash2 = {x => \"some value\"} has the contents of variable x as the key:"
puts "{\"hi there\"=>\"some value\"}"
