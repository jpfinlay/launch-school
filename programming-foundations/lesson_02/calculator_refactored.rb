# An application to take two numbers and either add, subtract, multiply
# or divide them and output the result.

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num =~ /[[:digit:]]/
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt "Welcome to Calculator! Enter your name:"

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure you use a valid name."
  else break
  end
end

prompt "Hello #{name}."

loop do # main loop
  # Get the first number
  number1 = ''
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt "Hmmm... That doesn't look like a valid number. Try again."
    end
  end

  # Get the second number
  number2 = ''
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt "Hmmm... That doesn't look like a valid number. Try again."
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Must choose 1, 2, 3 or 4."
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."
  sleep 2

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  puts "The result is #{result}"

  prompt "Do you want to perform another calculation? (Y to calculate again.)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
