# exercise_10.rb

puts "Q. Can hash values be arrays? Can you have an array of hashes? (give examples)"
puts "A. Yes."

puts "1. h = {names: [\"larry\", \"moe\", \"curly\"]}"
h = {names: ["larry", "moe", "curly"]}
puts h
puts h.class

puts "2. arr = [{name: \"bob\", age: 34}, {name: \"fred\", age: 44}]"
arr = [{name: "bob", age: 34}, {name: "fred", age: 44}]
puts arr
puts arr.class
