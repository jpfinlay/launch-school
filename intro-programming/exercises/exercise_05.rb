# exercise_05.rb
# Given we have the following:

array = [1,2,3,4,5,6,7,8,9,10]

array.unshift(0)
array.push(11)
puts array

# Now get rid of "11". And append a "3".

array.pop
array << 3
puts array
