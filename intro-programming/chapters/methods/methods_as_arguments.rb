def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(a, b)
  a * b
end

puts "Add 20 and 45:"
puts add(20, 45)
puts "Subtract 10 from 80:"
puts subtract(80, 10)
puts "Pass the above results into the multiply method:"
puts multiply(add(20, 45), subtract(80, 10))

puts "A more complicated example:"
puts "Multiply (20-6) by (30+5) and add the result to (80 - 10)"
puts add(subtract(80, 10), multiply(subtract(20, 6), add(30, 5)))
