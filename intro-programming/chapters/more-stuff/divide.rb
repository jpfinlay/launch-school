# divide.rb

# divide.rb

def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

puts divide(16, 4) # => 4
puts divide(4, 0) # divided by 0 => nil.
puts divide(14, 7) # => 2
