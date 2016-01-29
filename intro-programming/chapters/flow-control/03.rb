# A program that takes a number from the user between 0 and 100 and reports
# back whether the number is between 0 and 50, 51 and 100, or above 100.

def get_number
  puts "Enter a number between 0 and 100"
  num = gets.chomp.to_i
  if num < 0
    puts "#{num} is not between 0 and 100."
  elsif num <= 50
    puts "Your number was between 0 and 50."
  elsif num <= 100 
    puts "#{num} is between 51 and 100"
  else
    puts "Your number was greater than 100."
  end
end

get_number
