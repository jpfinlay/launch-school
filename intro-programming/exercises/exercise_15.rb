# exercise_15.rb

# Delete all words beginning with an 's' from the array.
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |e| e.start_with?('s') }
puts "Using start_with?, remove all words beginning with 's'"
puts arr

# Delete all words beginning with an 's' or a 'w' from the array.
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |e| e.start_with?('s', 'w') }
puts "Using start_with?, remove all words beginning with 's' or 'w'"
puts arr

# A different way of doing it!
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |e| e =~ /s/}
