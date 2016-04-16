require 'pry'

RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
SUITS = %w(C D H S).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def display_hands(player, dealer)
  system 'clear'
  puts ""
  puts " T W E N T Y  O N E ".center(80, "-")
  puts ""
  puts "You have: #{show_cards(player)} (TOTAL: #{count(player.flatten)})"
  puts ""
  puts "Dealer's hand: #{dealer[0][0]}, HIDDEN"
  puts ""
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

def count(hand)
  score = 0
  aces = 0
  cards = remove_suits(hand)
  cards.each do |card|
    if card =~ /[JQK]/
      score += 10
    elsif card =~ /[A]/
      aces += 1
    else
      score += card.to_i
    end
  end
  count_aces(score, aces)
end

def count_aces(score, aces)
  if (aces == 1 && score <= 10)
    score += 11
  elsif (aces == 1 && score > 10)
    score += 1
  elsif (aces == 2 && score <= 9)
    score += 12
  elsif (aces == 2 && score > 9)
    score += 2
  elsif (aces == 3 && score <= 8)
    score += 13
  elsif (aces == 3 && score > 8)
    score += 3
  elsif (aces == 4 && score <= 7)
    score += 14
  elsif (aces == 4 && score > 7)
    score += 4
  end
  score
end

def bust?(hand)
  score = count(hand)
  return true if score > 21 || false
end

def winner(player, dealer)
  winner = if bust?(player)
             "You're bust. Dealer won!"
           elsif bust?(dealer)
             "Dealer bust. You won!"
           elsif count(player) > count(dealer)
             "You won!"
           elsif count(player) < count(dealer)
             "Dealer won!"
           else
             "It's a tie."
           end
  system 'clear'
  puts ""
  puts " T W E N T Y  O N E ".center(80, "-")
  puts ""
  prompt(winner)
  prompt("Your hand was: #{show_cards(player)}, total #{count(player)}.")
  prompt("Dealer's hand was: #{show_cards(dealer)}, total #{count(dealer)}.")
end

loop do
  deck = initialize_deck
  player = []
  dealer = []
  player << deal(deck)
  dealer << deal(deck)
  
  display_hands(player, dealer)
  
  input = ''
  loop do
    display_hands(player, dealer)
    prompt("(h)it or (s)tay?")
    input = gets.chomp.downcase
    player << deck.shift if input.start_with?('h')
    break if bust?(player)
    break if input.start_with?('s')
  end
  
  loop do
    break if bust?(player)  
    if count(dealer) < 17 
      dealer << deck.shift
    else
      break
    end
  end
  
  display_hands(player, dealer)
  winner(player, dealer)
  
  prompt("Another game? (y or n)")
  answer = gets.chomp
  break unless answer.start_with?('y')
end

prompt("Thank you for playing. Good bye.")