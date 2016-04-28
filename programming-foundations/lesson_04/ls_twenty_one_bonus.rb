# Bonus Features

# Q1. Why can't we just replace all calls to total with a local variable?
# What's the key to watch out for when using a local variable to cache
# expensive calculations?

# A1. Calls to #total cannot be replaced with a local variable everywhere since
# the variable scope will change when it's called inside vs outside a loop
# or elsewhere in the source code.

# Q2. We use the play_again? three times: after the player busts, after the
# dealer busts, or after both participants stay and compare cards. Why is the
# last call to play_again? a little different from the previous two?

# A2. The first two calls to #play_again? use the ternary operator and in the
# first instance asks if the boolean return value from the method is true THEN
# the outer loop starts again at the beginning (a new game) OTHERWISE the main
# loop is broken out of and the program ends. The last call to #play_again?
# says 'break unless #play_again? is true' - in other words the first option is
# to quit the game and only repeat the game loop if play_again? is true.

SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze
DEALER_STOPS_AT = 17
TARGET_SCORE = 21

player_score = 0
dealer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > TARGET_SCORE
  end

  sum
end

def busted?(cards)
  total(cards) > TARGET_SCORE
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > TARGET_SCORE
    :player_busted
  elsif dealer_total > TARGET_SCORE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def compare_cards(dealer_cards, player_cards)
  puts "=".center(60, '=')
  prompt "Dealer had #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player had #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=".center(60, '=')
end

def display_scores(player_score, dealer_score)
  puts "=".center(60, '=')
  puts "Score: You (#{player_score}) - (#{dealer_score}) Dealer."
  puts "=".center(60, '=')
  sleep 1
end

system 'clear'
puts "=".center(60, '=')
puts "Welcome to Twenty One (w/bonus features!)"
puts "=".center(60, '=')
sleep 2

loop do
  # display scores and check for winner
  system 'clear'
  display_scores(player_score, dealer_score)
  break if player_score == 5 || dealer_score == 5

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

  player_turn = nil
  loop do
    loop do
      prompt "Would you like to (h)it or (s)tay? (Press 'q' to quit at any time)."
      player_turn = gets.chomp.downcase
      break if ['h', 's', 'q'].include?(player_turn)
      prompt "Sorry, must enter 'h', 's' or 'q'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end
    break if player_turn == 's' ||
             busted?(player_cards) ||
             player_turn == 'q'
  end

  break if player_turn == 'q'

  if busted?(player_cards)
    dealer_score += 1
    display_result(dealer_cards, player_cards)
    compare_cards(dealer_cards, player_cards)
    sleep 5
    next
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= DEALER_STOPS_AT
    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  # cache dealer and player totals
  dealer_total = total(dealer_cards)
  player_total = total(player_cards)

  if busted?(dealer_cards)
    player_score += 1
    display_result(dealer_cards, player_cards)
    compare_cards(dealer_cards, player_cards)
    sleep 5
    next
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # Both player and dealer stays - compare cards!
  compare_cards(dealer_cards, player_cards)
  if dealer_total > player_total
    dealer_score += 1
  elsif player_total > dealer_total
    player_score += 1
  end

  display_result(dealer_cards, player_cards)
  sleep 5
end

prompt "Thank you for playing Twenty-One! Good bye!"
