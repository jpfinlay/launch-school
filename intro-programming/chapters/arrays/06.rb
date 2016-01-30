# Example 06.rb

names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'
=> TypeError: no implicit conversion of String into Integer

# The problem is that we are trying to pass a string into the square brackets
# that require an integer. The fix is:

names[3] = "jody"

# The Launch School explanation is better (obviously!)

# You are attempting to set the value of an item in an array using a string as
# the key. Arrays are indexed with integers, not strings.
