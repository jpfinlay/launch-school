# An application to take two numbers and either (a)dd, s(ubtract), m(ultiply)
# or d(ivide) them to produce a result.

# This application was written before watching the video as a kind of self test
# and so I could compare my own approach to that of the instructor's.

p "Welcome to Calculator!"
p "Enter a number: "
n1 = gets.chomp.to_f
p "Enter another number: "
n2 = gets.chomp.to_f
p "(a)dd, s(ubtract), m(ultiply) or d(ivide): "
operation = gets.chomp

if operation == "a"
  puts "#{n1} plus #{n2} is: #{n1 + n2}."
elsif operation == "s"
  puts "#{n1} minus #{n2} is: #{n1 - n2}."
elsif operation == "m"
  puts "#{n1} multiplied by #{n2} is: #{n1 * n2}."
else
  puts "#{n1} divided by #{n2} is: #{n1 / n2}."
end
