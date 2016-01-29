# Count down to zero using recursion

def countdown(n)
  puts "Counting down to zero..."

  while n >= 0
    puts "#{n}..."
    n -= 1
  end
end

countdown(10)
