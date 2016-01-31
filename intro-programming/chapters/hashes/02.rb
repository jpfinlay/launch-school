# Exercise 02.rb

# Difference between hash methods merge and merge!

player = {name: 'Daniel', age: 25, position: 'forward'}
stats = {scored: 18, assists: 5}

puts "Using merge method:"
player.merge(stats) # should return a new hash without changing the original hashes
# => {:name=>"Daniel", :age=>25, :position=>"forward", :scored=>18, :assists=>5}
puts "player hash is #{player}"
# => {:name=>"Daniel", :age=>25, :position=>"forward"}
puts "stats hash is #{stats}"
# => {:scored=>18, :assists=>5}

puts "Using merge! method:"
player.merge!(stats) # should return the mutated player hash comlete with stats
# => {:name=>"Daniel", :age=>25, :position=>"forward", :scored=>18, :assists=>5}
puts "player hash is #{player}"
# => {:name=>"Daniel", :age=>25, :position=>"forward", :scored=>18, :assists=>5}
puts "stats hash is #{stats}"
# => {:scored=>18, :assists=>5}
