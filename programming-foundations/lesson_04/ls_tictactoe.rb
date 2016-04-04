require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +   # cols
                [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +   # rows
                [[1, 5, 9], [3, 5, 7]]                # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable all
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable all

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |n| brd[n] == ' ' }
end

def player_chooses_square!(brd)
  square = ''
  loop do
    prompt("Choose a sqaure (#{empty_squares(brd).join(', ')})")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt('Sorry, that is not a valid choice.')
  end
  brd[square] = PLAYER_MARKER
end

def computer_chooses_square!(brd)
  choice = empty_squares(brd).sample
  brd[choice] = COMPUTER_MARKER
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_chooses_square!(board)
    break if someone_won?(board) || board_full?(board)

    computer_chooses_square!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  break unless gets.chomp.downcase.start_with?("y")
end

prompt "Thank you for playing Tic Tac Toe. Good bye!"
