require 'pry'

RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
SUITS = %w(C D H S).freeze

def display_hands(player, dealer, count)
  system 'clear'
  puts ""
  puts "TWNETY ONE".center(50,"-")
  puts ""
  puts "You have: #{player.flatten.join(', ')} (TOTAL: #{count(player.flatten)})"
  puts ""
  puts "Dealer's hand: #{dealer[0][0]}, HIDDEN"
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
  return true if score > 21
end

def hit_or_stay?(player, dealer, deck)
  display_hands(player, dealer, count(player))
  
  loop do
    puts "=> (h)it or (s)tay?"
    input = gets.chomp.downcase
    if input.start_with?('h')
      player << deck.shift
    elsif input.start_with?('s')
      break puts "Stay on score."
    else
      puts "Sorry, that is not a valid choice."
    end
    display_hands(player, dealer, count(player))
  end
end

# def show_cards(hand)
#   hand.flatten!
# end

loop do # main game loop
  deck = initialize_deck

  player << deal(deck)
  dealer << deal(deck)

  hit_or_stay?(player, dealer, deck)
end
