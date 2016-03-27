# Exercises: Medium 2

### Question 1

Find the total age of just the male members of the family in the following hash:

```
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
```

#### My Solution

```
age = 0

munsters.each do |name, details|
  age += details["age"] if details["gender"] == "male"
end
```

### Question 2

One of the most frequently used real-world string properties is that of "string
substitution", where we take a hard-coded string and modify it with various
parameters from our program.

Given this previously seen family hash, print out the name, age and gender of
each family member:

```
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

like this: (Name) is a (age) year old (male or female).

#### My Solution

```
munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
end
```

### Question 3 - REVISE

Refactor this code to produce a more predictable result each time:

```
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

```

#### My Solution

```
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"

  puts "My string looks like this now: #{a_string_param}"
  puts "My array looks like this now: #{an_array_param}"
end

tricky_method("pumpkins", ["pumpkins"])
```

#### Launch School's Solution

```
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

### Question 4 - TAKE MORE CARE

Use ```String#split``` and ```Array#join``` to reverse the words in this string:

```
sentence = "Humpty Dumpty sat on a wall."
```

#### My Solution

```
sentence = "Humpty Dumpty sat on a wall."
words = sentence.split
words.reverse.join(' ')
```

#### Launch School's Solution

```
sentence = "Humpty Dumpty sat on a wall."
words = sentence.split(/\W/)
reversed_sentence = words.reverse.join(' ') + '.'
```

### Question 5

What is the output of the following code?

```
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

#### My Solution

The output (printed) should be 34 (42 - 8). This is because the ```answer```
variable is outside of the method scope and we are simply printing ```answer - 8 ```
at the end of our programme. ```new_answer``` will still point to the value of
50, but is not printed out.

### Question 6

One day Spot was playing with the Munster family's home computer and he wrote a
small program to mess with their demographic data. After writing this method,
he typed the following...and before Grandpa could stop him, he hit the Enter
key with his tail:

```
mess_with_demographics(munsters)
```

Did the family's data get ransacked, or did the mischief only mangle a local
copy of the original hash? (why?)

```
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

#### My Solution - REVISE

It mangles the original hash, but am unsure why exactly.


#### Launch School's Solution

Spot will find himself in the "dog" house for this one. The family's data is all
in a shambles now.

Why? Remember that in Ruby, what gets passed in the parameter list is not what
it appears. **Under the hood, ruby passes the object id of each item rather than
the value of the parameter.** The method internally stores these object id's in
locally scoped (private to the method) variables (named per the method
definition's parameter list).

So Spot's demo_hash starts off pointing to the munsters hash. His program could
wind up replacing that with some other object id and then the family's data
would be safe.

In this case, the program does not reassign demo_hash -- it just uses it as-is.
So the actual hash object that is being messed with inside of the method IS the
munsters hash.

### Question 7 - TAKE CARE!

Method calls can take expressions as arguments. Suppose we define a function
called rps as follows, which follows the classic rules of rock-paper-scissors
game, but with a slight twist that it declares whatever hand was used in the
tie as the result of that tie.

```
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

What is the result of the following call?

```
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

#### My Solution

The output should be ```"paper"```

### Question 8

```
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the output of the code ```bar(foo)``` given the above?

#### My Solution

```no```
