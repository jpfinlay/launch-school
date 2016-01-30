# Exercise 04.rb
# What does each retunr in each case?

arr = [15, 7, 18, 5, 12, 8, 5, 1]

1. arr.index(5)
=> 3
# First instance of the number five is at array index 3.

2. arr.index[5]
# NoMethodError: undefined method `[]' for #<Enumerator: [15, 7, 18, 5, 12, 8, 5, 1]:index>

3. arr[5]
=> 8
# Returns the value at index 5 of the array.
