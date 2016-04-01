# my_tic_tac_toe.rb
# A tic-tac-toe Ruby game app.

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

corner_squares = [1, 3, 7, 9]

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

def free_centre_square?(valid_picks)
  valid_picks.include?(5)
end

# def free_corner_square?(corner_squares, valid_picks, corner_square_choice)
#   corner_square_choice = (corner_squares - (corner_squares - valid_picks)).sample
#   return corner_square_choice
# end

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

def won_in_three?(numbers, winning_combinations)
  winning_combinations.each do |combination|
    return true if (combination <=> numbers.sort) == 0
  end
  false
end

def won_in_four?(numbers, winning_combinations)
  winning_combinations.each do |combination|
    not_winners = numbers - combination
    if not_winners.size == 1
      numbers.delete(not_winners[0])
      won_in_three?(numbers, winning_combinations)
    end
  end
end

def display_result(picks, winning_combinations)
  if  (won_in_three?(picks[:player], winning_combinations) == true) ||
      (won_in_three?(picks[:computer], winning_combinations) == true)
    return "WON in 3!"
  elsif (won_in_four?(picks[:player], winning_combinations) == true) ||
        (won_in_four?(picks[:computer], winning_combinations) == true)
    return "WON in 4!"
  else
    return false
  end
end

loop do # main outer loop
  # Set up board and winning combinations
  valid_picks = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  display_board(valid_picks)
  
  # Track player and computer number selections
  picks = { player: [], computer: [] }
  round = 0

  loop do # main inner loop
    input = ''
    result = ''
    free_corners = (corner_squares - (corner_squares - valid_picks))

    puts "Free corners: #{free_corners}"

    loop do # Get players input
      puts "\n"
      prompt("Select a square (#{list_remaining_board_numbers(valid_picks)}): ")
      input = gets.chomp

      number?(input) && valid_pick?(valid_picks, input, picks) ? break : prompt('Invalid choice. Try again.')
    end

    # Get the computer's choice
    # case picks
    # when free_centre_square?(valid_picks)
    #   picks[:computer] << 5
    # when free_corner_square?(corner_squares, valid_picks)
    #   picks[:computer]
    # else
    #   picks[:computer] << valid_picks.sample
    # end

    if free_centre_square?(valid_picks)
      picks[:computer] << 5
    elsif free_corners.size > 0
      picks[:computer] << free_corners.sample
    else
      picks[:computer] << valid_picks.sample
    end

    valid_picks.delete(picks[:computer].last)

    puts "Selections so far: #{picks}"

    round += 1
    display_board(valid_picks)

    case round
    when round > 5
      result = "IT'S A TIE!"
      break prompt(result)
    when 3
      result = display_result(picks, winning_combinations)
      break prompt(result) unless result == false
    when 4
      result = display_result(picks, winning_combinations)
      break prompt(result) unless result == false
    end
  end

  prompt('Play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thank you for playing. Good bye!\n")
