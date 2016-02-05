# exerxise_02.rb

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# It returns a Proc object because we did not call the block -> block.call
# If we do this then the following will be returned from the execute method:
# => Hello from inside the execute method!
