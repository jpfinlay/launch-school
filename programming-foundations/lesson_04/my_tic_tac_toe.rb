# my_tic_tac_toe.rb
# A tic-tac-toe application

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner, ELSE got to #2
# 6. If board is full, display tie. => if initial array has no elements left
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

# Set up board and winning combinations
valid_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
winning_combinations = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 9]
]

# Square selection logic
picks = []

def pick(valid_squares, pick, picks)
  if valid_squares.include?(pick)
    picks << pick
    valid_squares[pick - 1] = "X"
  else
    "Not a valid selection, please select a different square."
  end
end

def display_board(valid_squares)
  puts "\n\n"
  valid_squares.each_slice(3) { |slice| p slice.join('|') }
  # puts "|1|2|3|".center(50)
  # puts "|4|5|6|".center(50)
  # puts "|7|8|9|".center(50)
end

def list_valid_squares(valid_squares)
  valid_squares.reject { |e| e == "X" || e == "O" }.join(', ')
end

def integer?(input)
  /^\d+$/.match(input)
end

def number?(input)
  integer?(input)
end

def won?(winning_combinations, picks)
  winning_combinations.each do |combination|
    if (combination <=> picks.sort) == 0
      p "won"
    else
      break
    end
  end
end

loop do # main loop
  input = ''

  loop do
    display_board(valid_squares)
    puts "\n"
    print "Select a square (#{list_valid_squares(valid_squares)}): "
    input = gets.chomp.to_i

    pick(valid_squares, input, picks)
    #valid_squares.include?(input.to_s) ? break : "Invalid choice"
    p valid_squares
    p picks
  end

  break unless won? == false
end
