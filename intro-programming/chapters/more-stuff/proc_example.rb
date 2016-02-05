# proc_example.rb

talk = Proc.new do
  puts "I am talking."
end

talk.call

# => I am talking

# proc_example.rb

talk = Proc.new do |name|
  puts "I am talking to #{name}."
end

talk.call "Bob"
