'4' == 4 ? puts("TRUE") : puts("FALSE")
# This will print "FALSE" to screen returning nil

x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
 puts "Did you get it right?"
else
 puts "Did you?"
end
# This will print "Did you get it right?" because the left hand side of the
# expression evaluates to 3 which is equivalent to the right hand side.

y = 9
x = 10
if (x + 1) <= (y)
 puts "Alright."
elsif (x + 1) >= (y)
 puts "Alright now!"
elsif (y + 1) == x
 puts "ALRIGHT NOW!"
else
 puts "Alrighty!"
end
# If-else conditionals evaluate the first true value, so the output will be
# "Alright now!" despite the fact that the expression below it is also true.
