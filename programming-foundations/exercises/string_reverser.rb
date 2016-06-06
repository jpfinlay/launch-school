# string_reverser.rb: a program to reverse a string.

def reverse_string(str)
  temp_arr = str.split("")
  reversed_array = []

  1.upto(str.length) do
    reversed_array << temp_arr.pop
  end

  reversed_array.join('')
end

puts reverse_string("Hello world!")
