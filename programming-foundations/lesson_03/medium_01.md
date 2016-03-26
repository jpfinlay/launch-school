# Exercises: Medium 1

### Question 1

Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

#### My Solution

```
10.times { |n| puts str.rjust(str.length + n, ' ') }
```

#### Launch School's Solution

```
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
```

### Question 2

Create a hash that expresses the frequency with which each letter occurs in this string:

```
statement = "The Flintstones Rock"
```

#### My Solution

```
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
```

#### Launch School's Solution

```
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
```

### Question 3

The result of the following statement will be an error:

```
puts "the value of 40 + 2 is " + (40 + 2)
```

Why is this and what are two possible ways to fix this?

#### My Solution

This is because we are trying to add a string to a number. To do this we could:

```
puts "the value of 40 + 2 is #{40 + 2}" => 42
```

or

```
puts "the value of 40 + 2 is " + (40 + 2).to_s
```

### Question 4 - REVISE!

What happens when we modify an array while we are iterating over it? What would be output by this code?

```
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```

The output is the array ```[2, 3]```. This is because the each expects to be
iterating over four elements, but the array gets shortened by 1 element, which
creates a mismatch, hence the unexpected output.

```
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

The output is the array ```[1, 2]```

### Question 5

Change the method below, such that it does not fail if the method argument is
either zero or negative. Change only the loop construct.

```
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
```

#### My Solution

```
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  p divisors
end
```

**Bonus 1**

The purpose of the ```number % dividend == 0``` is to check that there is no remainder
when the number is divided by dividend. E.G.: 9 % 3 = 0 (3 goes into 9 with no remainder)
but 9 % 4 = 1 (4 goes into 9 twice, remainder 1).

**Bonus 2**
The purpose of the ```divisors``` call is to explicitly return the array,
otherwise ```nil``` would be returned instead.

### Question 6

Alyssa was asked to write an implementation of a rolling buffer. Elements are
added to the rolling buffer and if the buffer becomes full, then new elements
that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like ```<<```
or ```+``` for modifying the buffer?". Is there a difference between the two,
other than what operator she chose to use to add an element to the buffer?

```
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
```

#### My Solution

There is a difference. The ```input_array``` in the second solution does not change
throughout the execution of the programme, whereas the ```buffer``` *is changed*
as the programme is executed.

#### Launch School's Solution

Yes, there is a difference. While both methods have the same return value, in
the first implementation, the input argument called buffer will be modified and
will end up being changed after rolling_buffer1 returns. That is, the caller
will have the input array that they pass in be different once the call returns.
In the other implementation, rolling_buffer2 will not alter the caller's input
argument.

### Question 7

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
A user passes in two numbers, and the calculator will keep computing the
sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he
got an error. Something about the limit variable. What's wrong with the code?

```
limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

#### My Solution

The ```limit``` local variable is outside of the scope of the method. The
following should fix it:

```
def fib(first_num, second_num)
  limit = 15

  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

or

```
def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

### Question 8

In another example we used some built-in string methods to change the case of a
string. A notably missing method is something provided in Rails, but not in
Ruby itself...titleize! This method in Ruby on Rails creates a string that has
each word capitalized as it would be in a title.

Write your own version of the rails titleize implementation.

#### My Solution

```
def titleize(title)
  title.split.map { |word| word.capitalize }.join(' ')
end
```

### Question 9

Modify the hash below such that each member of the Munster family has an additional
"age_group" key that has one of three values describing the age group the
family member is in (kid, adult, or senior).

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a
senior is aged 65+.

```
munsters = {
  "Herman"  => { "age" => 32, "gender" => "male" },
  "Lily"    => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie"   => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```
#### My Solution
```
munsters.each do |key,value|
  inner_hash = value

  case inner_hash["age"]
  when 0..17
    inner_hash["age_group"] = "kid"
  when 18..64
    inner_hash["age_group"] = "adult"
  else
    inner_hash["age_group"] = "senior"  
  end
end
```
#### Launch School's Solution (much nicer than mine!)

```
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
```
