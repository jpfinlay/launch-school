# An application to take two numbers and either (a)dd, s(ubtract), m(ultiply)
# or d(ivide) them to produce a result.

p "Welcome to Calculator!"
p "What's the first number?"
number1 = gets.chomp
p "What's the second number?"
number2 = gets.chomp
p "What operation would you like to perform? 1) add, 2) subtract, 3) multiply or 4) divide: "
operation = gets.chomp

if operation == "1"
  result = number1.to_i + number2.to_i
elsif operation == "2"
  result = number1.to_i - number2.to_i
elsif operation == "3"
  result = number1.to_i * number2.to_i
else
  result = number1.to_f / number2.to_f
end

puts "The result is #{result}"
