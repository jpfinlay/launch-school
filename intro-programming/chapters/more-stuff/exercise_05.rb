# exercise_05.rb

# Q. Why does the code below fail with the excetion below

puts "This code below fails due to a missing ampersand '&' before the argument 'block' passed to the execute method."
puts "The following will fix it: "
puts "def execute(&block)"
puts '---'
puts "Running code now..."

def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# => block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError) from test.rb:5:in `<main>'
