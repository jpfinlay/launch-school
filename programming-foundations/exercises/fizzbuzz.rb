# Fizzbuzz.rb

# for a range of numbers, show "Fizz" for every number
# divisible by 3 and "Buzz" for every number divisible by 5
# otherwise print the number. For number 15 print "FizzBuzz"

# 1. Take two numbers as arguments to a method
# 2. Iterate over the range between those numbers and
# 3. if number % 3 == 0 then print "Fizz"
# 4. elseif number % 5 == 0 then print "Buzz"
# 5. elseif number % 3 == 0 && number % 5 == 0 then print "FizzBuzz"
# 6. else print number

def fizzbuzz(start_num, end_num)
  numbers = (start_num..end_num).to_a

  numbers.each do |n|
    fizz = (n % 3 == 0)
    buzz = (n % 5 == 0)
    location = n - 1
    puts case
         when fizz && buzz then numbers[location] = 'FizzBuzz'
         when fizz then numbers[location] = 'Fizz'
         when buzz then numbers[location] = 'Buzz'
         else n
         end
  end
end

fizzbuzz(1, 15)
