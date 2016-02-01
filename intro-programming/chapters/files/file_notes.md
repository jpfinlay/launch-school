# Files

Create a new file with read/write access:

```
my_file = File.new("file.txt", "w+")

```

## Opening files

Open an existing file with read/write access:
```
File.open("file.txt", "w+")

```
Access codes are:

r: read only
w: write only, overwriting everything in an existing file
w+: read and write, overwriting everything in an existing file
a+: read and write. If file exists, append to the end

## Opening and closing files

**Always close a file after opening it.** Files are automatically closed if opened with a block:
```
File.open("file.txt", "a+") do |file|
  file << "Here we are with a new line of text"
end

=> #<File:file.txt (closed)>
```

Use ```readlines``` to open a file line-by-line:
```
File.readlines("file.txt").each do |line|
  puts line
end
```

## Deleting a file
```
File.delete("file.txt")
```

## Dir and Pathname

### Dir
Dir shares some of File's methods. However, it is not an IO stream.

### Pathname
The Pathname class exposes pretty much all of the methods of File and Dir.
The advantage to using Pathname is you can declare an instance of it and access the class methods of File and Dir on the instance object.

### Example

To find all text files in the current working directory:

```
d = Dir.new(".")
while file = d.read do
  puts "#{file} has extension .txt" if File.extname(file) == ".txt"
end

---

simple_file.txt has extension .txt
simple_text_file.txt has extension .txt
original.txt has extension .txt
```
