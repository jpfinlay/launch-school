# twenty_one.rb - A Blackjack Game

RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
SUITS = %w(C D H S).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def display_hands(player, dealer, winner=nil)
  system 'clear'
  puts ""
  puts " T W E N T Y  O N E ".center(50, "-")
  puts ""
  puts "Your hand: #{show_cards(player)} (TOTAL: #{compute_points(player.flatten)})"
  puts ""
  puts "Dealer's hand: #{dealer[0][0]}, HIDDEN"
  puts ""
  puts winner if winner
end

def initialize_deck
  deck = []
  shuffled = RANKS.product(SUITS).shuffle!
  shuffled.each { |card| deck << card.reduce(:+) }
  deck
end

def deal(deck)
  deck.shift(2)
end

def show_cards(hand)
  hand.flatten.join('-')
end

def remove_suits(hand)
  numbers = hand.flatten.each do |card|
    card.gsub(/[CDHS]/, '')
  end
  numbers
end

def points_for_card(card)
  if card =~ /[JQK]/
    10
  elsif card =~ /[A]/
    11
  else
    card.to_i
  end
end

def compute_points(hand)
  cards = remove_suits(hand)
  score = 0
  cards.each { |card| score += points_for_card(card) }
  adjust_aces(cards, score)
end

def adjust_aces(cards, score)
  cards.each do |card|
    score -= 10 if card =~ /[A]/ && score > 21
  end
  score
end

def bust?(hand)
  score = compute_points(hand)
  return true if score > 21
end

def winner(player, dealer)
  winner = if bust?(player)
             "You're bust. Dealer won with #{show_cards(dealer)} " \
             "(TOTAL: #{compute_points(dealer)})."
           elsif bust?(dealer)
             "You won! Dealer bust with #{show_cards(dealer)} " \
             "(TOTAL: #{compute_points(dealer)})."
           elsif compute_points(player) > compute_points(dealer)
             "You won! Dealer had #{show_cards(dealer)} " \
             "(TOTAL: #{compute_points(dealer)})."
           elsif compute_points(player) < compute_points(dealer)
             "Dealer won with #{show_cards(dealer)} " \
             "(TOTAL: #{compute_points(dealer)})."
           else
             "It's a tie. Dealer's hand was #{show_cards(dealer)} " \
             "(TOTAL: #{compute_points(dealer)})."
           end
  display_hands(player, dealer, winner)
end

def get_user_choice(player, dealer, deck)
  input = ''
  loop do
    display_hands(player, dealer)
    prompt "Choose (h)it, (s)tay or (q)uit."
    input = gets.chomp.downcase
    player << deck.shift if input.start_with?('h')
    break if input.start_with?('s', 'q') ||
             bust?(player)
  end
  input
end

def dealer_turn(player, dealer, deck)
  loop do
    break if bust?(player)
    dealer << deck.shift while compute_points(dealer) < 17
    break
  end
  dealer
end

def play_again
  answer = ''
  loop do
    prompt "Another game? (Y)es or (N)o."
    answer = gets.chomp
    break if answer.downcase.start_with?('y', 'n')
    prompt "Please type 'y' to play again or 'n' to quit."
  end
  answer
end

loop do # main loop
  deck = initialize_deck
  player = []
  dealer = []
  player << deal(deck)
  dealer << deal(deck)

  input = get_user_choice(player, dealer, deck)
  break if input.start_with?('q')

  dealer_turn(player, dealer, deck)
  winner(player, dealer)

  answer = play_again
  break if answer == 'n'
end
prompt "Thank you for playing. Good bye."
