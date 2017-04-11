require_relative "card"
require_relative "human_player"
require_relative "board"
require_relative "computer_player"

class Game
  attr_accessor :board
  attr_accessor :player1

  def initialize(player1 = Player.new("name"))
    @board = Board.new
    @player1 = player1
  end

  def play
    @board.generate_cards
    @board.populate
    @player1.get_board(board)
    until @board.won?
      take_turn
    end
    puts "Game over"
  end

  def take_turn
    puts "Make a guess"
    guess1 = @player1.take_guess1
    @board.reveal(guess1)
    @board.render
    puts "Make another guess"
    guess2 = @player1.take_guess2
    @board.reveal(guess2)
    @board.render
    sleep(1)
    if @board[guess1].num != @board[guess2].num
      @board[guess1].hide
      @board[guess2].hide
    else @player1.delete_matches(guess1, guess2)
    end
  end
end
