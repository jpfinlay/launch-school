# my_tic_tac_toe.rb
# A tic-tac-toe Ruby game app.

def prompt(message)
  print("=> #{message} ")
end

def valid_pick?(valid_picks, input, picks)
  input = input.to_i
  if valid_picks.include?(input)
    picks[:player] << input
    valid_picks.delete(input)
  else
    false
  end
end

def display_board(valid_picks)
  puts "\n\n"
  valid_picks.each_slice(3) { |slice| p slice.join('|') }
  # puts "|1|2|3|".center(50)
  # puts "|4|5|6|".center(50)
  # puts "|7|8|9|".center(50)
end

def list_remaining_board_numbers(valid_picks)
  valid_picks.reject { |e| e == "X" || e == "O" }.join(', ')
end

def integer?(input)
  /^\d+$/.match(input)
end

def number?(input)
  integer?(input)
end

def winner?(numbers, winning_combinations)
  p numbers
  winning_combinations.each do |combi|
    if (combi <=> numbers.sort) == 0
      break true
    else
      false
    end
  end
  return false
end

def display_result(picks, winning_combinations)
  if winner?(picks[:player], winning_combinations)
    prompt("YOU WON!")
  elsif winner?(picks[:computer], winning_combinations)
    prompt("COMPUTER WON!")
  else
    prompt("IT'S A TIE!")
  end
end

loop do # main outer loop

  # Set up board and winning combinations
  valid_picks = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

  display_board(valid_picks)

  # Track player and computer number selections
  picks = { player: [], computer: [] }
  round = 0

  loop do # main inner loop
    input = ''

    loop do # Get players input
      puts "\n"
      prompt("Select a square (#{list_remaining_board_numbers(valid_picks)}): ")
      input = gets.chomp

      number?(input) && valid_pick?(valid_picks, input, picks) ? break : prompt('Invalid choice. Try again.')
    end

    # Get the computer's choice
    computer_pick = valid_picks.sample
    picks[:computer] << computer_pick
    valid_picks.delete(computer_pick)

    puts "Selections so far: #{picks}"

    round += 1
    display_board(valid_picks)

    if round == 3 || round == 4
      display_result(picks, winning_combinations)
    elsif round > 4
      prompt("IT'S A TIE!")
      break
    end
  end

  prompt('Play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thank you for playing. Good bye!")
