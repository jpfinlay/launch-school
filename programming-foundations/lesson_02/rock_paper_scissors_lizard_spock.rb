# rock_paper_scissors_lizard_spock.rb
# Assignment: RPS Bonus Features

# A more complex version of the game Rock, Paper, Scissors!
# See http://www.samkass.com/theories/RPSSL.html for details

# VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

valid_choices = { "r" => "rock",
                  "p" => "paper",
                  "s" => "scissors",
                  "l" => "lizard",
                  "sp" => "spock"
}

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

def get_valid_choice(choice)
  valid_choices[choice]
end

# Only needed if using the prompt method inside the user choice loop
#
# def print_valid_choices
#   choices = valid_choices.flatten.select! { |choice| choice.length > 2 }
#   choices.join(', ')
# end

loop do # main loop
  $player_score = 0     # Ugh! I don't want to use global variables, but can't
  $computer_score = 0   # think of another way without Classes and instance variables.

  puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"

  until $player_score == 5 || $computer_score == 5
    choice = ''

    loop do # User choice loop
      puts "=> Choose one: (r)ock, (p)aper, (s)cissors, (l)izard or (sp)ock:"
      choice = gets.chomp

      valid_choices.include?(choice) ? break : prompt('Invalid choice. Try again.')
    end

    player_choice = get_valid_choice(choice)
    computer_choice = valid_choices.to_a.sample[1]
    who_scores?(player_choice, computer_choice)
    display_result(player_choice, computer_choice)

    puts("You: #{$player_score} - #{$computer_score} Computer")
  end

  prompt('Play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
