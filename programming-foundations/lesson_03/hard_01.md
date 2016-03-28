# Exercises: Hard 1

### Question 1 - REVISE

What do you expect to happen when the greeting variable is referenced in the
last line of the code below?

```
if false
  greeting = “hello world”
end

greeting
```

#### My Solution

The above code will return an error: undefined local variable or method.

#### Launch School's Solution

```
=> nil
```

greeting is nil here, and no "undefined method or local variable" exception is
thrown. Typically, when you reference an uninitialized variable, Ruby will raise
an exception, stating that it’s undefined. However, **when you initialize a local
variable within an if block, even if that if block doesn’t get executed, the
local variable is initialized to nil.**

### Question 2

What is the result of the last line in the code below?

```
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```

#### My Solution

The output is: {a: 'hi there'}. This is because ```informal_greeting``` is pointing
to the same object as greetings: 'hi'. It is then mutated by the ```<<```
operator, creating 'hi there' as the new value of the object that ```greeeting```
is also pointing at.

#### Launch School's Solution

The output is {:a=>"hi there"}. The reason is because informal_greeting is a
reference to the original object. The line informal_greeting << ' there' was
using the String#<< method, which modifies the object that called it. This means
that the original object was changed, thereby impacting the value in greetings.
If instead of modifying the original object, we wanted only modify informal_greeting
but not greetings, there are a couple of options:

1. we could initialize informal_greeting with a reference to a new object containing
the same value by informal_greeting = greetings[:a].clone.
2. we can use string concatenation, informal_greeting = informal_greeting + ' there',
which returns a new String object instead of modifying the original object.

### Question 3

What will be printed by each of these code groups?

### Q3 Part A

```
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

#### My Solution Q3 Part A

Output will be:

one is: one
two is: two
three is: three

### Q3 Part B

```
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

```

#### My Solution Q3 Part B
