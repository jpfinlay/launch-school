def change_caps(str)
  str.upcase! if str.length > 10
  str
end

puts "'hello world' should be uppercased:"
puts change_caps("hello world") # Will change all letters to uppercase
puts "'hello' should NOT be uppercased:"
puts change_caps("hello") # Will NOT change all letters to uppercase
