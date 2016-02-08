# exercise_09.rb

h = {a:1, b:2, c:3, d:4}

puts "Suppose you have a hash h = {a:1, b:2, c:3, d:4}"
puts "1. Get the value of key `:b`."
puts h[:b]
puts '---'
puts "2. Add to this hash the key:value pair `{e:5}`"
h[:e] = 5
puts h
puts '---'
puts "3. Remove all key:value pairs whose value is less than 3.5."
puts h

h.delete_if {|key, value| value < 3.5 }

puts h
