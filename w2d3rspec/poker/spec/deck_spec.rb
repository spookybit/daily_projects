require 'rspec'
require 'deck'
require 'card'
require 'set'

describe 'Deck' do
  subject(:deck) { Deck.new }

  describe '#initialize' do
    it 'has 52 cards' do
      expect(deck.cards.count).to eq(52)
    end

    it 'has 13 of each suit' do
      expect(deck.cards.select{|x| x.suit == Suit.suit("DIAMOND")}.length).to eq(13)
      expect(deck.cards.select{|x| x.suit == Suit.suit("CLUB")}.length).to eq(13)
      expect(deck.cards.select{|x| x.suit == Suit.suit("HEART")}.length).to eq(13)
      expect(deck.cards.select{|x| x.suit == Suit.suit("SPADE")}.length).to eq(13)
    end

    it 'has 4 of each value' do
      expect(deck.cards.select{|x| x.value == Value.value("TWO")}.length).to eq(4)
      expect(deck.cards.select{|x| x.value == Value.value("FIVE")}.length).to eq(4)
      expect(deck.cards.select{|x| x.value == Value.value("EIGHT")}.length).to eq(4)
      expect(deck.cards.select{|x| x.value == Value.value("ACE")}.length).to eq(4)
    end
  end

  describe '#draw' do
    it 'pops a card from the top of the deck' do
      deck.draw
      expect(deck.cards.count).to eq(51)
    end
  end

  describe '#insert' do
    let(:card) { double('card', :value => 2, :suit => 1)}
    it 'inserts fake into the deck' do
      expect(deck.insert(card).value).to eq(2)
    end
  end
end
