require 'pry'

RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
SUITS = %w(C D H S).freeze
# CARD_VALUES = {
#   2: 2,
#   3: 3,
#   4: 4,
#   "2": 2,
#   "2": 2,
#   "2": 2,
#   "2": 2,
#   "2": 2,
#   "2": 2,
# }

player = []
dealer = []

def initialize_deck
  deck = []
  shuffled = RANKS.product(SUITS).shuffle!
  shuffled.each { |card| deck << card.reduce(:+) }
  deck
end

def deal(player, deck)
  deck.shift(2)
end

def hit(deck)
  deck.shift
end

def count(hand)
  score = 0
  hand.each do |card|
    if card[0] == "J" || card[0] == "Q" || card[0] == "K"
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
  return true if score > 21
end

def show_cards(hand)
  hand.flatten!
end

deck = initialize_deck

player << deal(player, deck)
player << hit(deck)

dealer << deal(dealer, deck)


puts "Player's hand: #{show_cards(player).join(', ')}: Score #{count(player)}"
puts "Dealer's hand: #{dealer[0][0]}, HIDDEN: Score #{count(dealer)}"

loop do 
  puts "(h)it or (s)tay?"
  input = gets.chomp.downcase
  break if input == "h" || input == "s"
  puts "Please input an 'h' to hit or a 's' to stay."
end