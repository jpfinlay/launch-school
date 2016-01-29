# What does the each method in the following program return after it is finished executing?

x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end

# The each method returns the original array since the result of the each iteration
# does not do anything with the output - e.g. modify the original array.

# => [1, 2, 3, 4, 5]
