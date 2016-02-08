# exercise_03.rb
# Iterate over each number greater than 5 in the array [1,2,3,4,5,6,7,8,9,10] and
# put all odd numbers into a new array

odd_numbers = []

[1,2,3,4,5,6,7,8,9,10].select { |i| odd_numbers << i if i > 5 && i.odd? }

puts "#{odd_numbers}"
