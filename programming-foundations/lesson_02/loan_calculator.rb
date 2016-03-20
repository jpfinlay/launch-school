# loan_calculator.rb
# An application to calculate the monthly interest rate and the loan duration.
# This application wraps Lesson 2 > Assignment: Mortgage Calculator

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def integer?(input)
  /^\d+$/.match(input)
end

def monthly_interest_rate(apr)
  (apr.to_f / 100) / 12
end

def loan_duration_months(loan_duration)
  loan_duration.to_i * 12
end

def monthly_repayment(l,c,n)
  l * (c * (1 + c)**n) / ((1 + c)**n - 1)
end

def prompt(message)
  print "=> #{message}: "
end

# Get
# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

puts "=== Welcome to Loan Calculator ==="
loop do
  loan_amount = ''
  loop do
    prompt "Please enter the loan amount in pounds, without punctuation or symbols (e.g. £150,000 should be inputted as 150000)"
    loan_amount = gets.chomp

    integer?(loan_amount) ? break : puts("Invalid input. Please enter an integer.")
  end

  apr = ''
  loop do
    prompt "Please enter the APR percentage (e.g. 3.6)"
    apr = gets.chomp

    float?(apr) ? break : puts("Invalid input. Please enter a floating point number only.")
  end

  loan_duration = ''
  loop do
    prompt "Please enter the loan duration (e.g. 20 years would be 20)"
    loan_duration = gets.chomp

    integer?(loan_duration) ? break : puts("Invalid input. Please enter an integer.")
  end

  l = loan_amount.to_i
  c = monthly_interest_rate(apr).to_f
  n = loan_duration_months(loan_duration).to_i

  puts ""
  puts " LOAN REPORT ".center(50, '=')
  puts "Amount: £#{loan_amount}"
  puts "Duration: #{loan_duration} years"
  puts "interest Rate (APR): #{apr}"
  puts "Monthly Repayment: £#{monthly_repayment(l,c,n).round}"
  puts "=".ljust(50, '=')
  puts ""
  puts "Do you want to calculate another loan?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
