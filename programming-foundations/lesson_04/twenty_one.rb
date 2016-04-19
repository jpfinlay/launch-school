# twenty_one.rb - A Blackjack Game
require 'pry'

RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
SUITS = %w(C D H S).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def display_hands(player, dealer, winner=nil)
  system 'clear'
  puts ""
  puts " T W E N T Y  O N E ".center(80, "-")
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

def compute_points(hand)
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
  if aces == 1 && score <= 10
    score += 11
  elsif aces == 1 && score > 10
    score += 1
  elsif aces == 2 && score <= 9
    score += 12
  elsif aces == 2 && score > 9
    score += 2
  elsif aces == 3 && score <= 8
    score += 13
  elsif aces == 3 && score > 8
    score += 3
  elsif aces == 4 && score <= 7
    score += 14
  elsif aces == 4 && score > 7
    score += 4
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

loop do
  deck = initialize_deck
  player = []
  dealer = []
  player << deal(deck)
  dealer << deal(deck)

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
    if compute_points(dealer) < 17
      dealer << deck.shift
    else
      break
    end
  end

  winner(player, dealer)

  play_again = ''
  loop do
    prompt "Another game? (Y)es or (N)o."
    play_again = gets.chomp
    break if play_again.downcase.start_with?('y', 'n')
    prompt "Please type 'y' to play again or 'n' to quit."
  end
  break if play_again == 'n'
end
prompt "Thank you for playing. Good bye."
