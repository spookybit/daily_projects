require 'rspec'
require 'card'

describe 'Card class' do
  subject (:card) { Card.new(Value.value("ACE"), Suit.suit("CLUB")) }

  describe '#initialize' do
    it "has a value" do
      expect(card.value).to eq(Value.value("ACE"))
    end

    it "has a suit" do
      expect(card.suit).to eq(Suit.suit("CLUB"))
    end
  end

  describe "#<=>" do
    it "compares two cards values" do
      queen = Card.new(Value.value("QUEEN"), Suit.suit("HEART"))
      expect(card <=> queen).to eq(1)
    end

    it "compares two cards suits" do
      ace_spade = Card.new(Value.value("ACE"), Suit.suit("SPADE"))
      expect(card <=> ace_spade).to eq(-1)
    end
  end


end
