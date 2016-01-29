# A program that takes a number from the user between 0 and 100 and reports
# back whether the number is between 0 and 50, 51 and 100, or above 100.

# Using the CASE statement

def case_statement(num)
  response = case
  when num < 0
    "#{num} is below 0."
  when num < 50
    "#{num} is between 0 and 50."
  when num < 101
    "#{num} is between 51 and 100."
  else
    "#{num} is greater than 100."
  end

  puts response
end

def if_else_statement(num)
  if num < 0
    "#{num} is not between 0 and 100."
  elsif num <= 50
    "Your number was between 0 and 50."
  elsif num <= 100
    "#{num} is between 51 and 100"
  else
    "Your number was greater than 100."
  end
end

puts "Enter a number between 0 and 100"
num = gets.chomp.to_i

case_statement(num)
puts if_else_statement(num)
