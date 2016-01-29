# while loop

# Write a while loop that takes input from the user, performs an action, and
# only stops when the user types "STOP". Each loop can get info from the user.

puts "Enter something (type STOP to finish): "
input = gets.chomp.to_s

while input != "STOP"
  puts "You didn't type 'STOP'"
  input = gets.chomp.to_s
end

puts "All done, you typed STOP"
