require_relative 'card.rb'

class Deck

  attr_reader :cards

  def initialize
    @cards = []
    generate_cards
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end

  def insert(card)
    @cards << card
    card
  end

  def generate_cards
    Suit::SUITS.values.each do |suit|
      Value::VALUES.values.each do |value|
        @cards << Card.new(value, suit)
      end
    end
    shuffle!
  end
end
