# An application to take two numbers and either add, subtract, multiply
# or divide them and output the result.

# This application wraps Lesson 2 > Assignment: Calculator Bonus Features

# 4. Get values from Calculator calculator_config.yml
require 'yaml'
MESSAGES = YAML.load_file('calculator_config.yml')
LANGUAGE = 'en'.freeze

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.print("=> #{message} ")
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input) # My solution was: /^[[:digit:]]+\.[[:digit:]]+/.match(input)
end

def integer?(input)
  /^\d+$/.match(input) # My solution was: /^[[:digit:]]+/.match(input)
end

def number?(input)
  integer?(input) || float?(input) # 1. Should improve validation of numbers
end

def operation_to_message(op)
  case op # 3. Save the result to a variable and explicitly return it
  when '1'
    prompt('adding')
  when '2'
    prompt('subtracting')
  when '3'
    prompt('multiplying')
  when '4'
    prompt('dividing')
  end
end

prompt('welcome')

name = ''
loop do
  name = gets.chomp

  name.empty? ? prompt(empty_name) : break
end

puts "#{prompt('greeting')} #{name}"

loop do # main loop
  # Get the first number
  number1 = ''
  loop do
    prompt('first_number')
    number1 = gets.chomp

    number?(number1) ? break : prompt('invalid_number')
  end

  # Get the second number
  number2 = ''
  loop do
    prompt('second_number')
    number2 = gets.chomp

    number?(number2) ? break : prompt('second_number')
  end

  prompt('operator_prompt')

  operator = ''
  loop do
    operator = gets.chomp

    %w(1 2 3 4).include?(operator) ? break : prompt('invalid_choice')
  end

  puts operation_to_message(operator)
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

  prompt('result')
  puts result

  prompt('another_calculation')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y', 's')
end
