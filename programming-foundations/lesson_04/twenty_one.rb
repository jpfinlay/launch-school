require 'pry'

RANKS = %w(2 3 4 5 6 7 8 9 10 j q k a).freeze
SUITS = %w(c d h s).freeze

def initialize_deck
  deck = RANKS.product(SUITS)
end

p initialize_deck
