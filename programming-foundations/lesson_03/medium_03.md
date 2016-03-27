# Exercises: Medium 3

### Question 1

Predict how the values and object ids will change throughout the flow of the code below:

```
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block.\n\n"

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
end
```

#### My Solution - WRONG! REVISE.

Before the block all variables have different object_ids. Inside the block the
object_ids change *after* variable reassignment, except ```d_outer```:

```
a_outer = 22
b_outer = "thirty three"
c_outer = [44]
d_outer = c[0] # remains the same.
```

Still inside the block:

```
a_inner = a.outer = 22
b_inner = b_outer = "thirty three"
c_inner = c_outer = [44]
d_inner = c_inner[0] # Should error as there is no c_inner variable elsewhere.
```
The object_ids of a_inner_id, b_inner_id and c_inner_id inside the loop should
be the same as the values for a_outer_id, b_outer_id and c_outer_id. d_inner_id
should not exist as the above declaration should result in an error.

#### Launch School's Solution

```
a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 47338990514840 before the block.
c_outer is [42] with an id of: 47338990514800 before the block.
d_outer is 42 with an id of: 85 before the block.

a_outer id was 85 before the block and is: 85 inside the block.
b_outer id was 47338990514840 before the block and is: 47338990514840 inside the block.
c_outer id was 47338990514800 before the block and is: 47338990514800 inside the block.
d_outer id was 85 before the block and is: 85 inside the block.

a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 47338990514840 before and: 47338990513980 after.
c_outer inside after reassignment is [44] with an id of: 47338990514800 before and: 47338990513960 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
b_inner is thirty three with an id of: 47338990513980 inside the block (compared to 47338990513980 for outer).
c_inner is [44] with an id of: 47338990513960 inside the block (compared to 47338990513960 for outer).
d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).

a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
b_outer is thirty three with an id of: 47338990514840 BEFORE and: 47338990513980 AFTER the block.
c_outer is [44] with an id of: 47338990514800 BEFORE and: 47338990513960 AFTER the block.
d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.

ugh ohhhhh
ugh ohhhhh
ugh ohhhhh
ugh ohhhhh

```

### Question 2

Predict how the values and object ids will change throughout the flow of the code
below:

```
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
end
```

#### Launch School's Solution - REVISE

Important: [... our] method call accepts **VALUES** as parameters. The names we
give to those values in the definition of our method are **SEPARATE** from any
other use of those same names.

### Question 3 - REVISE
Let's call a method, and pass both a string and an array as parameters and see
how even though they are treated in the same way by Ruby, the results can be different.

Study the following code and state what will be displayed...and why:

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

Output will be:

```
My string looks like this now: pumpkins
My array looks like this now: ["pumpkins", "rutabaga"]
```

Why?

The above code does not change the **value** of my_string, so "pumpkins" will be
returned in the first ```puts``` statement. However, the value of the array
passed to the method is mutated by the ```<<``` operator, so that will display
with two string elements inside it.

#### Launch School's Solution

```
My string looks like this now: pumpkins
My array looks like this now: ["pumpkins", "rutabaga"]
```

Why?

It seems clear from the above that Ruby treats string and array parameters
differently...but not so fast. Actually the parameters are treated in exactly
the same way...but the results are different.

In both cases, Ruby passes the parameter "by value", but unlike some other
languages, the value that gets passed is a reference to some object. The string
parameter is passed to the method as a reference to an object of type String.
Similarly, the array is passed to the method as a reference to an object of type
Array.

The important distinction is that while a reference is passed, the method makes
up a new variable for both the string and the array, and puts these references
in these new variables...these are variables that only live within the scope of
the method.

So if both parameters live inside the method as a new variable that stores a
reference to the passed object...why don't the string and the array behave the
same way in our output?

The difference lies in what Ruby does when the program executes either a
String#+= operation or an Array#<< operation.

**The string operation is re-assignment and CREATES A NEW STRING OBJECT.** The
reference to this new object is placed in the internal variable of the method,
and the method considers this new string object to be the one true string. It
has forgotten about the one that was passed in now. That old stale parameter
string is still remembered by the caller of the method...but the method itself
has forgotten all about it.

With the array, one array object can have any number of elements. When we attach
an additional element to an array using the << operator, Ruby simply keeps using
the same object that was passed in, and appends the new element to it.

So, because the method's array variable still points to the original object, the
caller's array variable and the method's array variable are still pointing at
the same object, and we see the results of what happened to the array "outside"
of the method.

### Question 4

To drive that last one home...let's turn the tables and have the string show a
modified output, while the array thwarts the method's efforts to modify the
caller's version of it.

```
def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

#### My Solution

The output will be:

```
My string looks like this now: pumpkins
My array looks like this now: ["pumpkins"]
```

This is because my_string is being directly mutated by the gsub! method inside
the tricky_method_two method. Whereas, the array inside the method is a new
assignment (the original array object's value remains the same).

### Question 5

How could the unnecessary duplication in this method be removed?

```
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
```

#### My Solution

```
def color_valid(color)
  color == "blue" || color == "green" ? true : false
end
```

#### Launch School's Solution

```
def color_valid(color)
  color == "blue" || color == "green"
end
```

**NOTE:** Of course! We only need to see if ```true``` is returned, otherwise
the method returns false by default. I need to take my time a bit more in future.
