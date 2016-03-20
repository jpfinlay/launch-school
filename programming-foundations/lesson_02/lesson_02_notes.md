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
