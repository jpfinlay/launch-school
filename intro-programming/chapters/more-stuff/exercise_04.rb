# exerxise_04.rb

# Working block call

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
