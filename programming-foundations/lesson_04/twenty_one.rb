require 'pry'

RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
SUITS = %w(C D H S).freeze

def display_hands(player, dealer)
  system 'clear'
  puts ""
  puts " T W E N T Y  O N E ".center(80,"-")
  puts ""
  puts "You have: #{player.flatten.join(', ')} (TOTAL: #{count(player.flatten)})"
  puts ""
  puts "Dealer's hand: #{dealer[0][0]}, HIDDEN"
  puts ""
end

player = []
dealer = []

def initialize_deck
  deck = []
  shuffled = RANKS.product(SUITS).shuffle!
  shuffled.each { |card| deck << card.reduce(:+) }
  deck
end

def deal(deck)
  deck.shift(2)
end

def hit(hand, deck)
  hand << deck.shift
end

def count(hand)
  score = 0
  hand.flatten.each do |card|
    if card[0] == "J" or card[0] == "Q" or card[0] == "K"
      score += 10
    elsif card[0] == "A" && score <= 10
      score += 11 || score += 1
    elsif card[0] == "A" && score > 10
      score += 1
    else
      score += card[0].to_i
    end
  end
  return score
end

def bust?(hand)
  score = count(hand)
  return "BUST!" if score > 21
end

def hit!(hand, deck)
  hand << deck.shift 
end

def show_cards(hand)
  hand.flatten.join('-')
end

deck = initialize_deck

player << deal(deck)
dealer << deal(deck)

display_hands(player, dealer)

loop do
  display_hands(player, dealer)
  
  puts "=> (h)it or (s)tay?"
  input = gets.chomp.downcase
  
  player << deck.shift if input.start_with?('h')
  break if bust?(player)
  
  if input.start_with?('s')
    "Player stays on #{count(player)}."
    break
  end 
  #puts "Sorry, that is not a valid choice."
end

display_hands(player, dealer)

if bust?(player)
  puts "".center(80, '-')
  puts "BUST! You lost :("
  puts "Your hand was: #{show_cards(player)}, total #{count(player)}."
  puts "Dealer's hand was: #{show_cards(dealer)}, total #{count(dealer)}."
  puts "Good bye."
else 
  puts "Player has: #{count(player)}."
  puts "Dealer has: #{show_cards(dealer)}."
end
  
# loop do
#   display_hands(player, dealer)
#   break unless count(dealer) < 17
#   dealer << deck.shift
# end
