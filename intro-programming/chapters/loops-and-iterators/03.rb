# 03.rb 
# A method to iterate through an array that prints each index and value of the array.

animals = %w[lion monkey zebra warthog merecat tiger giraffe]

animals.each_with_index { |a,i| puts "#{i+1}. #{a}" }
