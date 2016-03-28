# my_tic_tac_toe.rb
# A tic-tac-toe application

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

# |O|O|O|
# |X|X|O|
# |O|X|O|

# 3|.|.|.|
# 2|.|.|.|
# 1|.|.|.|

# empty_board = Array.new(9)
$valid_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def current_board(input)
  input -= 1
  empty_board[input] = 1
end

def update_board(input)
  $valid_squares.delete(input)
end

def display_empty_board
  puts "\n\n"
  puts "|1|2|3|".center(50)
  puts "|4|5|6|".center(50)
  puts "|7|8|9|".center(50)
end

def integer?(input)
  /^\d+$/.match(input)
end

def number?(input)
  integer?(input)
end

display_empty_board
puts "\n"
print "Select a square (#{$valid_squares}): "
input = gets.chomp.to_i

p input
update_board(input)

p $valid_squares

#
# puts "Enter a grid referece (A1, A2, A3, B1, B2, B3, C1, C2, C3): "
# player = gets.chomp
