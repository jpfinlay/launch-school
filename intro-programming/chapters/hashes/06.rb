# Exercise 06.rb

# A program that prints out groups of words that are anagrams.

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams = {}

words.each do |w|
  key = w.split('').sort.join
  if anagrams.has_key?(key)
    anagrams[key].push(w)
  else
    anagrams[key] = [w]
  end
end

anagrams.each do |k,v|
  puts "---"
  p v
end
