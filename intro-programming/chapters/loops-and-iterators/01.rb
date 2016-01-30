# Exercise 01.rb
# What does the each method in the following program return after it is finished executing?

x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end

# The return value from the each loop will be nil since nothing is being done
# on the values of x and a is a local variable that will disappear when the
# loop ends

# [1,2,3,4,5] => nil
