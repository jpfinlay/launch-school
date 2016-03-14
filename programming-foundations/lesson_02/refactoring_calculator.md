# Things to think about:

## Q1.
Is there a better way to validate that the user has input a number?

```
def valid_number?(num)
  num.to_i != 0
end
```

Is suspect through use of a regex, possibly ...

```
def valid_number?(num)
  num =~ /[[:digit:]]/
end
```

## Q2.
It looks like you can call to_i or to_f to convert strings to integers and
floats, respectively. Look up the String#to_i and String#to_f documentation in
Ruby docs and look at their various examples and use cases.

Done.

## Q3.
Our operation_to_message method is a little dangerous, because we're relying on the case statement being the last expression in the method. What if we needed to add some code after the case statement within the method? What changes would be needed to keep the method working with the rest of the program? We'll show a solution in an upcoming assignment.

Currently we have:

```
def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end
```
We could assign the result of the case statement to a variable and explicitly return the result at the end of the method:

```
def operation_to_message(op)
result = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end

  # other_stuff_that_doesn't belong here!!
  # ...
  # ...

  return result

end
```

## Q4.
Most Rubyists don't invoke methods with parentheses, unless they're passing in a parameter. For example, we use name.empty?(), but most Rubyists would write name.empty?. Some Rubyists even go as far as not putting parentheses around method calls even when passing in parameters. For example, they would write prompt "hi there" as opposed to prompt("hi there").

Try removing some of the optional parentheses when calling methods to get your eyes acquainted with reading different styles of Ruby code. This will be especially useful if you are using a DSL written in Ruby, like Rspec or Rails.

## Q5.
We're using Kernel.puts() and Kernel.gets(). But the Kernel. is extraneous as well as the parentheses. Therefore, we can just call those methods by gets and puts. We already know that in Ruby we can omit the parentheses, but how come we can also omit the Kernel.?

### My answer (before looking at the Launch School answer!)

The Kernel module is included by class Object, so its methods are available in every Ruby object, thus ```puts``` is a kind of global method. Behind the scenes Ruby checks to see if ```puts``` is a local variable or a local method. If not, then it goes up through the class structure within Ruby to find it.

### Launch School's answer

When we write Ruby code that's not in a class, we are working within an object called main, which is an instance of Object. The Kernel module is automatically loaded by Object, giving us access to all of its methods.

## Q6.
There are lots of messages sprinkled throughout the program. Could we move them into some configuration file and access by key? This would allow us to manage the messages much easier, and we could even internationalize the messages. This is just a thought experiment, and no need to code this up.

Yes. We could create a hash of key:value pairs like so:

```
messages = {
  :welcome => "=> Welcome to Calculator.",
  :get_number => "Please enter a number",
  ...
}

prompt(messages[:welcome]) # => "Welcome to Calculator."
```
