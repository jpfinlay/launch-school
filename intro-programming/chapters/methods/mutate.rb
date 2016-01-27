# Example of a method that modifies its argument permanently
# mutate.rb

a = [1,2,3]

def mutate(array)
  array.pop
end

p "Before mutate method: #{a}" # Print with quotes
mutate(a)
puts "After mutate method: #{a}" # Print without quotes
