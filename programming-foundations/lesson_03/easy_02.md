# Exercises: Easy 1

### Question 1

Determine if "Spot" has an age in the following hash:

```
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

#### My Solution

```
ages.has_key?("Spot")
```

**Bonus**
What other two hash methods would work just as well?

```
ages.include?("Spot")
```

```
ages.member?("Spot")
```

### Question 2

Add up all the ages from the Munster family hash:

```
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

#### My Solution

```
ages.values.reduce(:+)
```

#### Launch School's Solution
```
ages.values.inject(:+)
```

### Question 3

In the ages hash, throw out all the people older than 100.

```
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

#### My Solution
```
ages.select! { |name, age| age < 100 }
```

#### Launch School's Solution
```
ages.keep_if { |name, age| age < 100 }
```

### Question 4

Starting with this string:

```
"The Munsters are creepy in a good way."
```

Convert the string in the following ways (code will be executed on original ```munsters_description``` above):

```
"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

#### My Solution

```
munsters_description.capitalize! => "The munsters are creepy in a good way."
munsters_description.swapcase!   => "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.downcase!   => "the munsters are creepy in a good way."
munsters_description.upcase!     => "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

### Question 5

We have most of the Munster family in our age hash:

```
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```

Add ages for Marilyn and Spot to the existing hash

```
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

#### My Solution

```
ages.merge!(additional_ages)
```

### Question 6

Pick out the minimum age from the existing Munsters hash:

```
ages = {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237}
```

#### My Solution

```
ages.values.min
```

### Question 7

See if the word "Dino" exists in the string below:

```
advice = "Few things in life are as important as house training your pet dinosaur."
```

#### My Solution

```
advice.include?("Dino")
```

#### Launch School's Solution

```
advice.match("Dino")
```

### Question 8

Find the index of the first name that starts with "Be" in the array below:

```
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

#### My Solution

```
flintstones.each_with_index { |name, index| puts index if name.start_with?("Be") }
```

#### Launch School's Solution

```
flintstones.index { |name| name[0, 2] == "Be" }
```

### Question 9
Using ```array#map!```, shorten each of these names to just 3 characters:

```
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

#### My Solution

```
flintstones.map! { |name| name[0..2] }
```

#### Launch School's Solution

```
flintstones.map! |name|
  name[0, 3]
end
```

### Question 10

Again, shorten each of these names to just 3 characters -- but this time do it all on one line:

```
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

#### My Solution

See solution for question 9, above
