# iterating_over_hashes.rb

h = {name: 'bob', height: '1.7 m', weight: '75 kg', hair: 'brown'}

h.each do |key, value|
  puts "Bob's #{key} is #{value}"
end
