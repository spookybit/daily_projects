class Card
  include Comparable

  attr_reader :suit, :value

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def <=>(other)
    value_comp = self.value <=> other.value
    value_comp == 0 ? self.suit <=> other.suit : value_comp
  end

  def to_s
    "#{Value.to_s(@value)} of #{Suit.to_s(@suit)}"
  end
end

module Suit
  SUITS = { "DIAMOND" => 0, "CLUB" => 1, "HEART" => 2, "SPADE" => 3 }.freeze

  def self.suit(key)
    Suit::SUITS[key]
  end

  def self.to_s(value)
    Suit::SUITS.key(value)
  end
end

module Value
  VALUES = {
    "TWO" => 2,
    "THREE" => 3,
    "FOUR" => 4,
    "FIVE" => 5,
    "SIX" => 6,
    "SEVEN" => 7,
    "EIGHT" => 8,
    "NINE" => 9,
    "TEN" => 10,
    "JACK" => 11,
    "QUEEN" => 12,
    "KING" => 13,
    "ACE" => 14
  }.freeze

  def self.value(key)
    Value::VALUES[key]
  end

  def self.to_s(value)
    Value::VALUES.key(value)
  end
end
