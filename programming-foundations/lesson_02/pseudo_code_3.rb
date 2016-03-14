# This is the pseudo code for a method that takes an array of integers, and
# returns a new array with every other element

## CASUAL PSEUDO CODE

# Given that we have an array of integers
  # create a new array
  # iterate over the original array
  # store every other element inside the new array
  # return the new array

## FORAML PSEUDO CODE

# START
#
# Given an array of intgegers, original_array = [1, 3, 5, 7, 9, 11]
#
# SET iterator = 1
# SET new_array = []
#
# WHILE iterator < length of array
#   SET new_array = value of array at location iterator
#
#   iterator = iterator + 2
#
# PRINT new_array
#
# END

original_array = [1, 3, 5, 7, 9, 11]
new_array = []

i = 1
original_array.each do
  new_array << original_array[i]
  i += 2
end

p new_array.compact
