# Exercise 02.rb
# What will the following programs return? What is value of arr after each?

# 1.
arr = ["b", "a"]
# ["b", "a"]
arr = arr.product(Array(1..3))
# ["b",1]["b",2]["b",3]["a",1]["a",2]["a",3]
arr.first.delete(arr.first.last)
# => 1
# ["b"]["b",2]["b",3]["a",1]["a",2]["a",3]

# Program 1. will return 1. The value of arr is ["b"]["b",2]["b",3]["a",1]["a",2]["a",3]

# This is because arr.first is ["b",1] and the delete method is being called
# with the argument (arr.first.last), which is the last element in the first
# element of arr (1). The delete method mutates the original array,
# hence the value of arr is ["b"]["b",2]["b",3]["a",1]["a",2]["a",3]

# 2.
arr = ["b", "a"]
# ["b", "a"]
arr = arr.product([Array(1..3)])
# [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
arr.first.delete(arr.first.last)
# => [1,2,3]
# [["b"], ["a", [1, 2, 3]]]

# Program 2. will return [1,2,3]. The value of arr is [["b"], ["a", [1, 2, 3]]]
