# remove_vowels.rb: A program that takes an array of strings and returns them,
# minus the vowels.

# This exercise was in the Beginning Ruby part 5 Launch School video with
# guest student Conrad

def remove_vowels(arr)
  arr.each do |string|
    string.gsub!(/[aeiou]/, "")
  end
end

puts remove_vowels(["green", "yellow", "black", "white"])

# Conrad's version

# VOWELS = ["a", "e", "i", "o", "u"]
#
# def remove_vowels(strings)
#   strings.map do |string|
#     chars = string.split("")
#     VOWELS.each { | vowel| chars.delete(vowel) }
#     chars.join("")
#   end
# end
