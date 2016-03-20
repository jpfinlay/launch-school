# rock_paper_scissors.rb
# A simple version of the game Rock, Paper, Scissors

VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def display_result(player, computer)
  if  (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    prompt("You chose #{player}; computer chose #{computer}. You won!")
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    prompt("You chose #{player}; computer chose #{computer}. Computer won!")
  else
    prompt("You chose #{player}; computer chose #{computer}. It's a tie!")
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
  break unless answer.start_with?('y')
end
prompt("Thank you for playing. Good bye!")
