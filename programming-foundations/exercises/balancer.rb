# balancer.rb

# Write a method that takes a string and returns a boolean indicating whether
# this string has a balanced set of parentheses.

# This exercise was in the Beginning Ruby part 5 Launch School video with
# guest student Conrad

# My method (no bonus)
# def balancer?(string)
#   openp   = string.count("(")
#   closedp = string.count(")")
#
#   openp == closedp ? true : false
# end

# My method (with bonus)
# def balancer?(string)
#   pos_open    = (0..string.length).find_all { |i| string[i,1] == '(' }
#   pos_closed  = (0..string.length).find_all { |i| string[i,1] == ')' }
#
#
#
#   if pos_open.empty? && pos_closed.empty?
#     "No parenthesis"
#   elsif pos_open.size == pos_closed.size && (pos_open[0] < pos_closed[0])
#     true
#   else
#     false
#   end
# end
#
# puts balancer?("hi")    # => true
# puts balancer?("(hi")   # => false
# puts balancer?("(hi)")  # => true
#
# # Bonus
# puts balancer?(")hi(")  # => false
# puts balancer?("(()) )(")# => false
#
# Conrad's method (no bonus)
# def balancer?(string)
#   string.count("(") == string.count(")")
# end

# Conrad's method (with bonus)

string = "(()))("
count = 0

string.split("").each do |char|
  count += 1 if char == "("
  count -= 1 if char == ")"
  p false if count < 0
end
