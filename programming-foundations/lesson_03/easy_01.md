# Exercises: Easy 1

### Question 1

What would you expect the following code to print out?

```
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

The above code will output the original array ```[1, 2, 2, 3]```. This is because
the ```uniq``` method was called without the bang operator, so the array remains
unchanged.

### Question 2

Describe the difference between ```!``` and ```?``` in Ruby.

The ```!``` operator usually indicates a  destructive action in Ruby. For example,
in Q1, calling ```numbers.uniq!``` would have created a new array from the existing one
that contains no duplicate numbers => ```[1, 2, 3]```. A question mark is often
used in methods to indicate an expected boolean (true or false) out put from that
method. An example would be ```"Hello".inlcude?("e")``` => ```true```.

And explain what would happen in the following scenarios:

1. what is ```!=``` and where should you use it?
This means 'not equal to'. Often used in conditional statements.

2. put ```!``` before something, like ```!user_name```
This means 'not'. ```if !user_name sign_up else log_in```

3. put ```!``` after something, like ```words.uniq!```
A new array will be created from the existing one that contains only (in this case)
words that are unique => ```words = %w(four four two) => ["four", "two"]```

4. put ```?``` before something
If used as part of the ternary operator means "then". For example:

```
words.size > 2 ? puts 'There are 2 words' : 'There are less than 2 words'
```

The above example in English reads: If the size of words is greater than 2 THEN print 'There are 2 words' ELSE print 'There are less than 2 words'.

In any other situation I think use of ? before something, like ```?numbers``` would return a syntax error.

5. put ```?``` after something
If a question mark is put after a method, like ```include?```, this would indicate that method returns true or false.

6. put ```!!``` before something, like ```!!user_name```
This is the same as asserting that something is true by calling NOT on something (presumably a method above) twice.

### Question 3

Replace the word "important" with "urgent" in this string:
```
advice = "Few things in life are as important as house training your pet dinosaur."
```

My Solution:

```
advice = advice.split(' ')
  advice.map { |w| w.include?('important') ? w = 'urgent' : w
end
advice.join(' ')

=> "Few things in life are as urgent as house training your pet dinosaur."
```

Launch School's Solution
```
advice.gsub!('important', 'urgent')
```

Aaarrrggghhh!!! Of course!

### Question 4

Given:

```
numbers = [1, 2, 3, 4, 5]
```

What do the following method calls do (assume we reset numbers to the original array between method calls)?

```
numbers.delete_all(1)
numbers.delete(1)
```

The method ```delete_all(1)``` will delete the value stored in location 1 of the array (the second index, as indexing starts at zero).

The method ```delete(1)``` will delete the value '1' from the array *wherever* it is stored.

Both methods mutate the array in-place (like a 'bang method') and return the value deleted.

### Question 5

Programmatically determine if 42 lies between 10 and 100.

My Solution

```
(10..100).include?(42)
```

Launch School's Solution
```
(10..100).cover?(42)
```

### Question 6
Starting with the string:

```
famous_words = "seven years ago..."
```

show two different ways to put the expected "Four score and " in front of it.

#### My Solution (1)
```
famous_words = "seven years ago..."
"Four score and " + famous_words
```

#### My Solution (2)
```
famous_words = "seven years ago..."
"Four score and #{famous_words}"
```

#### Launch School's Solutions
```
famous_words = "seven years ago..."
"Four score and " + famous_words
```

```
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
```

```
famous_words = "seven years ago..."
"Four score and " << famous_words
```

### Question 7
```
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
```

This gives us a string that looks like a "recursive" method call:

```
"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
```

If we take advantage of Ruby's Kernel#eval method to have it execute this string
as if it *were* a "recursive" method call, what will be the result?

```
eval(how_deep)
=> 42
```

The ```#eval``` method treats the string as a method call. Therefore, when
the method is called passing in how_deep, it evaluates the method 5 times:

```
add_eight(number)                   => 10
add_eight(add_eight(number))        => 18
add_eight((add_eight(number)))      => 26
add_eight(((add_eight(number))))    => 34
add_eight((((add_eight(number)))))  => 42
```

### Question 8
Turn the following nested array into an un-nested one:

```
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```

flintstones.flatten!

### Question 9
Given the hash:

```
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```

Turn this into an array containing only two elements: Barney's name and Barney's number.

#### My Solution

The problem with this solution is that it assumes prior knowledge of the location of
"Barney" and his number in the hash and subsequent array.
```
barney = flintstones.to_a.flatten[4..5]
```

#### Launch School's Solution

```
flintstones.assoc("Barney")
```

#### Question 10

Turn this array below into a hash where the names are the keys and the values are the positions in the array.

```
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```

#### My Solution

```
h = {}
flintstones.each_with_index do |key, index|
  h[key] = index
end
p h
```
