require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +   # cols
                [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +   # rows
                [[1, 5, 9], [3, 5, 7]]                # diagonals
FIRST = { choose: true, player: false, computer: false }.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable AbcSize
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
# rubocop:enable AbcSize

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
  choice = computer_attack(brd) ||
           immediate_threat?(brd) ||
           square_five_free?(brd) ||
           empty_squares(brd).sample
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

# Bonus Feature #1
# Note: I created LS solution first but discounted it as it used Array#join,
# which I thought was cheating!
def joinor(array, delimiter=',', join_word="or")
  return array[0].to_s if array.size == 1
  string = ''
  last = ' ' + join_word.to_s + ' ' + array.pop.to_s
  array.each { |el| string << el.to_s + delimiter + ' ' }
  string.chop!.chop!
  string += last
end

# Bonus Feature #2
player_score = 0
computer_score = 0

# Bonus Feature #3
def immediate_threat?(brd)
  find_best_square(brd, PLAYER_MARKER)
end

# Bonus Feature #4
def computer_attack(brd)
  find_best_square(brd, COMPUTER_MARKER)
end

# Iterate available board numbers to find the square needed to block or attack
def find_best_square(brd, marker)
  square_number = false
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      line.each { |el| square_number = el if brd[el] != marker }
    end
  end
  square_number
end

# Bonus Feature #5
def square_five_free?(brd)
  return 5 if brd[5] == ' '
end

# Bonus Feature #6
def alternate_player(current_player)
  if current_player == 'c'
    'p'
  else
    'c'
  end
end

def choose_square!(brd, current_player)
  if current_player == 'p'
    player_chooses_square!(brd)
  else
    computer_chooses_square!(brd)
  end
end

loop do
  answer = ''
  board = initialize_board
  if FIRST[:choose] == true
    loop do
      system 'clear'
      prompt "Choose who goes first: (P)layer or (C)omputer (or type Q to quit): "
      answer = gets.chomp.downcase
      break if answer == 'p' || answer == 'c'
      break if answer == 'q'
      system 'clear'
      prompt "Please choose either 'P', 'C' or 'Q' to quit."
    end
  elsif FIRST[:player] == true
    answer = 'p'
  else
    answer = 'c'
  end

  current_player = answer
  break if answer == 'q'

  loop do
    display_board(board)
    choose_square!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board) && detect_winner(board) == "Player"
    display_board(board)
    player_score += 1
    prompt "Player won!"
  elsif someone_won?(board) && detect_winner(board) == "Computer"
    display_board(board)
    computer_score += 1
    prompt "Computer won!"
  else
    display_board(board)
    prompt "It's a tie! No score."
  end

  prompt "Player #{player_score} - #{computer_score} Computer"

  sleep 2

  break if player_score == 5 || computer_score == 5
end

prompt "Thank you for playing Tic Tac Toe. Good bye!"
