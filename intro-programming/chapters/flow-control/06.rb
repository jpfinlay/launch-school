# Missing end statement
# The error:
# test_code.rb:96: syntax error, unexpected end-of-input, expecting keyword_end
# means there is a missing end keyword. Given the indentation it is the if-else
# conditional statement that is erroneous.

def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  # missing end keyword goes here!
end
equal_to_four(5)
