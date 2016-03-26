def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  p divisors
end

factors(99)
factors(12)
factors(0)
factors(-99)
