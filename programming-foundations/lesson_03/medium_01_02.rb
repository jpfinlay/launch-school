statement = "The Flintstones Rock"
string = statement.split(' ').join

result = {}
count = 1

string.each_char do |key|
  if result.has_key?(key)
    result[key] = count + 1
  else
    result[key] = 1
  end
end

puts result
