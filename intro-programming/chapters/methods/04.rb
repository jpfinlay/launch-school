# 04.rb

# This program will return nothing, since we have explicitly
# called return before printing the value of words.

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")
