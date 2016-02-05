# begin_rescue.rb

names = ['bob', 'joe', 'steve', nil, 'frank']


puts 'With a begin-rescue-end block:'
names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!"
  end
end

puts '---'

puts 'Without a begin-rescue-end block:'
names.each do |name|
  puts "#{name}'s name has #{name.length} letters in it."
end

# => undefined method `length' for nil:NilClass (NoMethodError)
