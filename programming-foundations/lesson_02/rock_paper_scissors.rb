# rock_paper_scissors.rb
# A simple version of the game Rock, Paper, Scissors

VALID_CHOICES = %w(rock paper scissors).freeze

def prompt(message)
  puts "=> #{message}"
end

def player_won?(player, computer)
  (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
end

def computer_won?(player, computer)
  (player == 'rock' && computer == 'paper') ||
    (player == 'paper' && computer == 'scissors') ||
    (player == 'scissors' && computer == 'rock')
end

def display_result(player, computer)
  if player_won?(player, computer)
    prompt("YOU WON! You chose #{player}; computer chose #{computer}.")
  elsif computer_won?(player, computer)
    prompt("COMPUTER WON! You chose #{player}; computer chose #{computer}.")
  else
    prompt("IT'S A TIE! You chose #{player}; computer chose #{computer}.")
  end
end

loop do # main loop
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
    choice = gets.chomp

    VALID_CHOICES.include?(choice) ? break : prompt('Invalid choice. Try again.')
  end

  computer_choice = VALID_CHOICES.sample

  display_result(choice, computer_choice)

  prompt('Play again?')
  answer = gets.chomp
  break unless answer.donwcase.start_with?('y')
end
prompt("Thank you for playing. Good bye!")
