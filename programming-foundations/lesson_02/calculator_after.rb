# An application to take two numbers and either add, subtract, multiply
# or divide them and output the result.

# take two numbers from the user and store the numbers in local variables
# take the operation type from the user and store in a local variable
# perform the operation on the two numbers
# output the result

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
