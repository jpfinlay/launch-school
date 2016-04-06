require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +   # cols
                [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +   # rows
                [[1, 5, 9], [3, 5, 7]]                # diagonals

# TTT Bonus Feature 1.
# Note: I created LS solution first but discounted it as it used Array#join,
# which I thought was cheating!
def joinor(array, delimiter=',', join_word="or")
  return string = array[0].to_s if array.size == 1
  string = ''
  last = "#{join_word} " + array.pop.to_s
  array.each { |el| string << el.to_s + delimiter + ' ' }
  string += last
  return string
end

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
    prompt("Choose a square (#{joinor(empty_squares(brd), ',')})")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt('Sorry, that is not a valid choice.')
  end
  brd[square] = PLAYER_MARKER
end

def computer_chooses_square!(brd)
  if immediate_threat?

  choice = empty_squares(brd).sample
  brd[choice] = COMPUTER_MARKER
end

def immediate_threat?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      # find the number needed to block
    end
  end
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

def up_score
  score += 1
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_chooses_square!(board)
    break if someone_won?(board) || board_full?(board)

    computer_chooses_square!(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board) && detect_winner(board) == "Player"
    player_score += 1
    prompt "Player won!"
  elsif someone_won?(board) && detect_winner(board) == "Computer"
    computer_score += 1
    prompt "Computer won!"
  else
    prompt "It's a tie! No score."
  end

  prompt "Player #{player_score} - #{computer_score} Computer"

  sleep 2
  display_board(board)

  break if player_score == 5 || computer_score == 5
  # prompt "Play again? (y or n)"
  # break unless gets.chomp.downcase.start_with?("y")
end

prompt "Thank you for playing Tic Tac Toe. Good bye!"
