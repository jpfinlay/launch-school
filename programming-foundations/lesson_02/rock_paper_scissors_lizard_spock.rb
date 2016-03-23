# rock_paper_scissors_lizard_spock.rb
# Assignment: RPS Bonus Features

# A more complex version of the game Rock, Paper, Scissors!
# See http://www.samkass.com/theories/RPSSL.html for details

VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'spock' && second == 'scissors')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("YOU WON! You chose #{player}; computer chose #{computer}.")
  elsif win?(computer, player)
    prompt("COMPUTER WON! You chose #{player}; computer chose #{computer}.")
  else
    prompt("IT'S A TIE! You chose #{player}; computer chose #{computer}.")
  end
end

def who_scores?(player, computer)
  if win?(player, computer)
    $player_score += 1
  elsif win?(computer, player)
    $computer_score += 1
  else
    prompt("No score.")
  end
end

loop do # main loop
  $player_score = 0     # Ugh! I don't want to use global variables, but can't
  $computer_score = 0   # think of another way without Classes and instance variables.

  puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"

  until $player_score == 5 || $computer_score == 5
    choice = ''


    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
      choice = gets.chomp

      VALID_CHOICES.include?(choice) ? break : prompt('Invalid choice. Try again.')
    end

    computer_choice = VALID_CHOICES.sample

    who_scores?(choice, computer_choice)

    display_result(choice, computer_choice)

    puts("You: #{$player_score} - #{$computer_score} Computer")
  end

  prompt('Play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
