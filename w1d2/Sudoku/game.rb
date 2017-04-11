require_relative 'tile'
require_relative 'board'

class Game

  attr_accessor :board

  def initialize(file, board = Board.new(file))
    @board = board
  end

  def play
    until board.solved?
      board.render
      puts "Chose a spot"
      pos = gets.chomp.split(",").map(&:to_i)
      puts "Choose a number"
      value = gets.chomp.to_i
      board[pos] = value
    end
    puts "Congrats!"
  end
end
