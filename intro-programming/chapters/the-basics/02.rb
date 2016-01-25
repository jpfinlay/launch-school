puts "This program will output the number of thousands, hundreds, tens and ones
in a four digit number."
puts "---"
puts "Enter a number: "
num = gets.chomp.to_i
puts "Thou: #{num / 1000}"
puts "Hund: #{num % 1000 /  100}"
puts "Tens: #{num % 100 / 10}"
puts "Ones: #{num % 10}"
