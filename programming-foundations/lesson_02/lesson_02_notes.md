# Lesson 2 Notes

## Pass by reference / Pass by value

Ruby can act as if it passes objects to methods as values but also as if it passes objects as references.

When an object is passed as a value, the original object is "copied" and remains unaffected by a method call. Example:

```
def cap(str)
  str.capitalize
end

name = "jim"
cap(name)
puts name # => 'jim'
```

In the above code, the method does not mutate the object, hence the original object remains the same.

```
def cap(str)
  str.capitalize!
end

name = "jim"
cap(name)
puts name # => 'Jim'
```

In the code above, ```capitalize!``` *mutates the object*, so Ruby is behaving like the original object is passed to the method and that object is permanently changed or mutated.

### The Lesson:

** When an operation within the method mutates the caller, it will affect the original object. **

## Coding Tips 2

### Organising Your Code

> Making your code readable is of paramount importance, not only for others, but for future self.

```
name = ''

puts "Enter your name: "
loop do
  name = gets.chomp
  break unless name.empty?
  puts "That's an invalid name. Try again:"
end

puts "Welcome #{name}!"
puts "What would you like to do?"
```

Visually, you can quickly see where the name variable is initialized. You can
also see that this small code snippet is roughly divided into 3 parts:

1. variable initialization
2. user input and validation
3. using the variable

The above enables easier debugging.

### Methods

**Don't write methods** that has both 'side effects' and returns a value. Methods
should do one thing only.

Choose sensible method names and prepend them with meaningful information - a verb -
e.g. ```print_user_name``` - should print (or output) a user's name to the display
and should not return anything.

Don't mix up concerns. Don't write a method that mutates, outputs and returns a
meaningful value. Make sure your methods just do one of those things.

### Mutation

Don't mutate the caller during iteration. Here the words array is being mutated
*within* the block leading to unexpected results:

```
words = %w(scooby doo on channel two)
words.each {|str| words.delete(str)}
puts words.inspect        # => ["doo", "channel"]
```

### Variable Shadowing

Choose variable names wisely (especially block variables). Below, the outer
scoped variable 'name' gets clobbered by the block variable:

```
name = 'johnson'

['kim', 'joe', 'sam'].each do |name|
  # uh-oh, we cannot access the outer scoped "name"!
  puts "#{name} #{name}"
end
```

Note that the below is not variable shadowing:

```
name = 'johnson'

['kim', 'joe', 'sam'].each do |fname|
  name = fname
end
```

### Assignment in Conditionals

**Don't do it!**

```
# bad

if some_variable = get_a_value_from_somewhere
  puts some_variable
end

# good

some_variable = get_a_value_from_somewhere
if some_variable
  puts some_variable
end
```
