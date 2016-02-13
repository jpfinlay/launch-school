# exercise_16.rb

# Turn the original array into a new array that consists of strings containing
# one word. (ex. ["white snow", etc...] → ["white", "snow", etc...].

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

arr = a.map { |e| e.split(' ') }
arr.flatten!
