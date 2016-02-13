# exercise_17.rb

# What will the following program output?

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

# The output is that the hashes are the same. Hashes are unordered lists, so
# if the content of two hashes is the same, they are equal, irrespective of order.

puts "Given:"
puts "hash1 = {shoes: \"nike\", \"hat\" => \"adidas\", :hoodie => true}"
puts "And:"
puts "hash2 = {\"hat\" => \"adidas\", :shoes => \"nike\", hoodie: true}"
puts "Is hash1 equivalent to hash2?"
puts "*****"
puts "Yes. he output is that the hashes are the same. Hashes are unordered lists, so if the content of two hashes is the same, they are equal, irrespective of order."
