# Exercise 02.rb
# A a while loop that takes input from the user, performs an action, and only
# stops when the user types "STOP"

puts "Shall I continue?"
x = gets.chomp
while x != 'STOP'
  puts "Shall I continue continuing?"
  x = gets.chomp
end
