# Example of a method that does not mutate the caller
# no_mutate.rb

a = [1,2,3]

def no_mutate(array)
  array.last
end

p "Before no_mutate method: #{a}" # Print with quotes
no_mutate(a)
puts "After no_mutate method: #{a}" # Print without quotes
