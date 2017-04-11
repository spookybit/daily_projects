require 'rspec'
require 'towers_of_hanoi'

describe "Plays Towers of Hanoi" do
  subject(:game) { HanoiGame.new }

  describe "#initialize" do
    it "sets up the board" do
      expect(game.board).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#move" do
    it "moves a piece (number) from one pole (array) to another" do
      game.move(0,1)
      expect(game.board).not_to eq([[3, 2, 1], [], []])
      expect(game.board).to eq([[3, 2], [1], []])
    end

    it "rejects invalid move when larger num is placed on smaller" do
      expect { game.move(0,10) }.to raise_error("Pole not in bounds")
    end
  end

  describe "#won" do
    context "pieces (numbers) for decending (3,2,1) order" do
      it "checks an unsolved puzzle is not solved" do
        expect(game.won?).to eq(false)
      end

      it "solves the game and checks if game is solved" do
        game.move(0, 2)
        game.move(0, 1)
        game.move(2, 1)
        game.move(0, 2)
        game.move(1, 0)
        game.move(1, 2)
        game.move(0, 2)
        expect(game.won?).to eq(true)
      end
    end

  end

end
