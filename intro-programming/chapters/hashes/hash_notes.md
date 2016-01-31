# Hashes

A hash is a data structure that stores items by associated keys. They are
sometimes referred to as key-value pairs.

A hash is commonly created using symbols as keys and any data types as values.

The old syntax for hashes is:
```
h = {:key => value}
h = {:name => "Bob"}

```
The new syntax (as of Ruby 1.9) is:
```
h = {key: value}
h = {name: "Bob"}
```
## Modifying hashes

```
>> person = {height: '1.65m', hair: 'brown', weight: '70kg'}
=> {:height=>"1.65m", :hair=>"brown", :weight=>"70kg"}


```

### Adding key-values to a hash

```
>> person[:age] = 30
=> 30
>> person
=> {:height=>"1.65m", :hair=>"brown", :weight=>"70kg", :age=>30}

```

### Deleting key-values from a hash

```
>> person.delete(:age)
=> 30
>> person
=> {:height=>"1.65m", :hair=>"brown", :weight=>"70kg"}
```
### Obtaining information from a hash

```
>> person[:height]
=> "1.65m"
```

### Merging hashes

```
>> another_hash = {name: "Bob"}
=> {:name=>"Bob"}
>> person.merge!(another_hash)
=> {:height=>"1.65m", :hair=>"brown", :weight=>"70kg", :name=>"Bob"}
```
## Passing a hash as an optional parameter in a method call
Curly braces, { }, are not required when a hash is the last argument. This convention is commonly used by Rails developers. So, instead of:

```
greeting("Bob", options={age: 44, city: "Liverpool"})

```
You can write:
```
greeting("Bob", age: 30, city: "Liverpool")

```

## Hashes vs Arrays

Questions to ask on deciding which to use:

1. Does this data need to be associated with a specific label? If yes, use a hash. If the data doesn't have a natural label, then typically an array will work fine.
2. Does order matter? If yes, then use an array. As of Ruby 1.9, hashes also maintain order, but usually ordered items are stored in an array.
3. Do I need a "stack" or a "queue" structure? Arrays are good at mimicking simple "first-in-first-out" queues, or "last-in-first-out" stacks.

## Common hash methods

Given we have a hash as follows:

```
>> name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}

```

### has_key?
The has_key? method allows you to check if a hash contains a specific key. It
returns a boolean value.
```
>> name_and_age.has_key?("Bob")
=> true

>> name_and_age.has_key?("Larry")
=> false
```

### select
The select method allows you to pass a block and will return any key-value pairs
that evaluate to true when ran through the block.
```
>> name_and_age.select {|k,v| k == "Bob"}
=> {"Bob"=>42}
>> name_and_age.select {|k,v| k == "Larry"}
=> {}

>> name_and_age.select { |k,v| (k == "Bob") || (v == 19) }
=> {"Bob"=>42, "Joe"=>19}
```

### fetch
The fetch method allows you to pass a given key and it will return the value for
that key if it exists. You can also specify an option for return if that key is not present.
```
>> name_and_age.fetch("Steve")
=> 31

>> name_and_age.fetch("Jack")
KeyError: key not found: "Jack"
```

### to_a
The to_a method returns an array version of your hash when called.
```
>> name_and_age.to_a
=> [["Bob", 42], ["Steve", 31], ["Joe", 19]]

```
## Keys and values
To find all keys in a hash:
```
>> name_and_age.keys
=> ["Bob", "Steve", "Joe"]
```

To find all the values in a hash:
```
>> name_and_age.values
=> [42, 31, 19]
```
