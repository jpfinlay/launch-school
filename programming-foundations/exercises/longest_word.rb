# longest_word.rb: a program to find the longest word in a sentence

sentence = "The quick brown fox jumped over the lazy dog"
words = sentence.split(" ")
longest = words.max {|a,b| a.length <=> b.length }

p "The longest word in the sentence '#{sentence}' is: #{longest.upcase}."
