# This is the pseudo code for a method that takes an array of strings, and
# returns a string that is all those strings concatenated together

## CASUAL PSEUDO CODE

# Given that we have an array of strings
  # set a result variable equal to the first string in the array
  # iterate over the array from the second location to the last
  # at each location in the array, add the string to the result variable
  # return the result variable

## FORAML PSEUDO CODE

# START
#
# # Given an array of strings, strings = ["the","quick","brown","fox"]
#
# SET iterator = 1
# SET result = value of the string in the first location in array "strings"
#
# WHILE iterator < length of array
#   SET result = result + value of array "strings" at location iterator
#
#   iterator = iterator + 1
#
# PRINT result
#
# END

strings = %w[the quick brown fox]
result = strings.shift

strings.each do |string|
  result = result + ' ' + string
end

p result
