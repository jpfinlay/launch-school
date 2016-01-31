# optional_parameters.rb

def greeting(name, options={})
  if options.empty?
    puts "Hi, my name is #{name}."
  else
    puts "Hi, my name is #{name} I'm #{options[:age]} years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", options={age: 30, city: 'New York City'})

# Can also do this:
greeting("Jack", age: 40, city: 'Liverpool')
