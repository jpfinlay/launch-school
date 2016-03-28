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

#### My Solution Q3 Part B - REVISE

The expected output is:

```
puts "one is: two"
puts "two is: three"
puts "three is: one"
```

#### Launch School Solution Q3 Part B

The variables are re-assigned in the method, but are only visible within the
scope  of the method, therefore the three variable values are unchanged. The
expected output is:

```
puts "one is: one"
puts "two is: two"
puts "three is: three"
```

### Q3 Part C

```
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

#### My Solution Q3 Part C

Due to the ! method, each of the three variable values are changed in-place. The
expected output is:

```
puts "one is: two"
puts "two is: three"
puts "three is: one"
```

#### Launch School Solution Q3 Part C

The expected output is:

```
puts "one is: two"
puts "two is: three"
puts "three is: one"
```

### Question 4
A UUID is a type of identifier often used as a way to uniquely identify items...
which may not all be created by the same system. That is, without any form of
synchronization, two or more separate computer systems can create new items and
label them with a UUID with no significant chance of stepping on each other's
toes.

It accomplishes this feat through massive randomization. The number of possible
UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5
sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.

#### My Solution

```
require 'securerandom'

def generate_uuid
  SecureRandom.hex
end
```

The above solution takes advantage of the SecureRandom library :) The below,
naive?, solution does not.

```
def generate_uuid
  character_array = []

  32.times do
    character_array << rand(16).to_s(16)
  end

  string1 = character_array[0..7].join + '-'
  string2 = character_array[8..11].join + '-'
  string3 = character_array[12..15].join + '-'
  string4 = character_array[16..19].join + '-'
  string5 = character_array[20..32].join

  result = string1 + string2 + string3 + string4 + string5

end
```

#### Launch School's Solution

```
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
```

### Question 5 - REVISE

Ben was tasked to write a simple ruby method to determine if an input string is
an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not
familiar with regular expressions. Alyssa supplied Ben with a method called
is_a_number? to determine if a string is a number and asked Ben to use it.

```
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break if !is_a_number?(word)
  end
  return true
end
```

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few
things. You're not returning a false condition, and not handling the case that
there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or
"1.2.3.4.5" should be invalid)."

Help Ben fix the code.

#### My Solution
```
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4
    true
  else
    return "Not a valid IP address."
  end
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break if !is_a_number?(word)
  end
  return true
end
```

#### Launch School's Solution

There are several ways to fix this. To determine if there are exactly 4
dot-separated "words" in the string, you can simply add a check for
dot_separated_words.size after splitting the string.

The other error in Ben's code is that instead of returning false upon
encountering a non-numeric component, he used break to break out of the while
loop. Once he breaks, control falls through to the return true statement. He can
fix this by performing return false instead of break.

```
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end
```
