require_relative "card"
require_relative 'computer_player'

class Board
  attr_accessor :grid
  attr_reader :stack
  def initialize(size=4)
    @grid = Array.new(size){Array.new(size)}
    @stack = []
  end



  def generate_cards
    2.times {(1..8).each {|num| @stack << Card.new(num)}}
  end

  def populate
    shuffled = @stack.shuffle
    @grid.map! do |row|
      row.map! do |sq|
        sq = shuffled.pop
      end
    end
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x,y = pos
    @grid[x][y] = value
  end

  def render
    @grid.each do |row|
      display = []
      row.each do |card|
        if card.face_up == false
          display << '*'
        else display << card.num
        end
      end
      p display
    end
  end

  def won?
    @grid.all? do |row|
      row.all? do |card|
        card.face_up
      end
    end
  end

  def reveal(guessed_pos)
    card = self[guessed_pos]
    if card.face_up == false
      card.reveal
      card.num
    end
  end
end
