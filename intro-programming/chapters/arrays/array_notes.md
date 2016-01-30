# Arrays

An array is an ordered list of objects. It can contain objects of any type - strings, integers, floats and so on.

It is convention that a bang "!" at the end of a method mutates the original object. Examples of methods such for arrays are:

```
map! , uniq!

```

Methods that mutate an array that *do not* have a bang operator are:

```
pop, push (<<), unshift

```

## Common Array methods
Some common array methods include:

### #flatten

```
a = [1,2,[3,4]]
a.flatten
=> [1,2,3,4]

```

### #include?

```
a = [1,2,3]
a.include?(2)
=> true

```

### #each_with_index

```
a = %w[cat dog fish lion monkey zebra]
a.each_with_index { |v,i| puts "#{i+1}. #{v}" }
1. cat
2. dog
3. fish
4. lion
5. monkey
6. zebra

=> ["cat","dog","fish","lion","monkey","zebra"]

```


## #each vs #map

#each runs the code in the block once for each element in the collection and returns the collection it was invoked on.

```
a = [1,2,3]
a.each { |e| e**2 }

=> [1,2,3]

```

#map differs from each in that it creates and returns a new array containing the values returned by the block.

```
a = [1,2,3]
a.map { |e| e**2 }

=> [1,4,9]

```
