# variables_and_pointers.rb

# Variables are pointers, example 1
a = "hi there"
# => "hi there"
b = a
# => "hi there"
a = "not here"
# => "not here"
b
# => "hi there"

# Variables are pointers, example 2
a = "hi there"
# => "hi there"
b = a
# => "hi there"
a << ", Bob"
# => "hi there, Bob"
b
# => "hi there, Bob"

# Variables are pointers, example 3
a = [1,2,3,3]
# => [1, 2, 3, 3]
b = a
# => [1, 2, 3, 3]
c = a.uniq
# => [1, 2, 3]
a
# => [1, 2, 3, 3]
b
# => [1, 2, 3, 3]
c
# => [1, 2, 3]

c = a.uniq!
# => [1, 2, 3]
a
# => [1, 2, 3]
b
# => [1, 2, 3]

# Variables are pointers, example 4 (methods does not mutate caller)
def test(b)
  b.map {|letter| "I like letter: #{letter}"}
end

a = %w[a b c]
# => ["a", "b", "c"]
test(a)
# => ["I like letter: a", "I like letter: b", "I like letter: c"]
a
# => ["a", "b", "c"]

# Variables are pointers, example 5 (method DOES mutate caller)
def test(b)
  b.map! {|letter| "I like letter: #{letter}"}
end

a = %w[a b c]
# => ["a", "b", "c"]
test(a)
# => ["I like letter: a", "I like letter: b", "I like letter: c"]
a
# => ["I like letter: a", "I like letter: b", "I like letter: c"]
